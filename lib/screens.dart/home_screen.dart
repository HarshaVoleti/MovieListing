import 'package:flutter/material.dart';
import 'package:movielisting/providers/movies_provider.dart';
import 'package:movielisting/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        elevation: 10,
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      "https://www.expertia.ai/_next/image?url=https%3A%2F%2Fd1qx7guo221nxn.cloudfront.net%2Fgeeksynergy%2Flogo_-HruQPqg.jpeg&w=3840&q=75",
                    ),
                  ),
                  Text(
                    "GeekSynergy Technologies",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const ListTile(
              title: Text(
                "Address : ",
              ),
              subtitle: Text(
                "Sanjayanagar, Bengaluru-56",
              ),
            ),
            const ListTile(
              title: Text(
                "Phone : ",
              ),
              subtitle: Text(
                "XXXXXXXX09",
              ),
            ),
            const ListTile(
              title: Text(
                "Email : ",
              ),
              subtitle: Text(
                "XXXXXXXXXXXXX@gmail.com",
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: Text(
                "Logout",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                ),
              ),
            ),
            const Text(
              "Developed by : Harsha Voleti ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Movies'),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
        height: size.height,
        width: size.width,
        child: Consumer<MoviesProvider>(builder: (context, provider, _) {
          int lengt = provider.movies.length;

          // return Text(lengt.toString());
          return ListView.builder(
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            itemCount: provider.movies.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              if (provider.errorFetching) {
                return Center(
                  child: Text(
                      'Failed to load movies ${provider.errorfetchMessage}'),
                );
              }
              if (provider.isfetchLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final movie = provider.movies[index];

              return Container(
                height: 235,
                color: Colors.white,
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      // padding: EdgeInsets.only(top: 10),
                      // margin: EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          // color: Colors.amber,
                          ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_drop_up_sharp,
                                  size: 40,
                                ),
                              ),
                              Text(movie.totalVoted.toString()),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_drop_down_sharp,
                                  size: 40,
                                ),
                              ),
                              const Text(
                                "Votes",
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: (size.width * 0.2) * 2,
                            width: size.width * 0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(movie.poster),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: (size.width * 0.2) * 2,
                              child: Column(
                                // mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movie.title,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Genres : ${movie.genre.join(", ")}",
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    "Director : ${movie.director.join(", ")}",
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    "Actors : ${movie.stars.join(", ")}",
                                    maxLines: 1,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    "Mins | ${movie.language} | ${movie.releasedDate}",
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  Text(
                                    "${movie.pageViews} Views | Voted by ${movie.totalVoted} People",
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      onTap: () {},
                      child: const Text(
                        "Watch Trailer",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
