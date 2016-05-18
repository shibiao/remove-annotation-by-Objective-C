# remove-annotation-by-Objective-C
##输入OC文件,去除文件中所有的注释,并输出去除注释后的文件.
###实现效果如下
<pre><code>
define WIDTH self.view.frame.size.width
define HEIGHT self.view.frame.size.height
//随机颜色
[UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1]

self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];//常用代码
/*
 这里的内容将会被删除
 */
self.upperScrollView.backgroundColor=[UIColor grayColor];
</code></pre>
###运行程序后实现的效果
<pre><code>
define WIDTH self.view.frame.size.width
define HEIGHT self.view.frame.size.height

[UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1]

self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

self.upperScrollView.backgroundColor=[UIColor grayColor];
</code></pre>
###所有的注释都被删除
