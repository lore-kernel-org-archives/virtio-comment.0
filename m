Return-Path: virtio-comment-return-1884-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2EAAF9862E4
	for <virtio-comment@lists.oasis-open.org>; Mon,  7 Jun 2021 05:25:39 +0000 (UTC)
References: <e687cd6bdafe1ad13205d99989163299649e20c9.1622794175.git.viresh.kumar@linaro.org>
 <db7ad3b4-36b5-1988-8f9a-b50a7e820150@metux.net>
 <CAKohpomU=0nO+yyywniZmLegvWSz9WdSf4jVwR=Z2J_XXoh8iA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <66c30d89-c7ed-fc1a-fd0c-6ff188f675cb@redhat.com>
Date: Mon, 7 Jun 2021 13:25:14 +0800
MIME-Version: 1.0
In-Reply-To: <CAKohpomU=0nO+yyywniZmLegvWSz9WdSf4jVwR=Z2J_XXoh8iA@mail.gmail.com>
Subject: Re: [virtio-comment] [PATCH V2] virtio-gpio: add the device
 specification
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Viresh Kumar <viresh.kumar@linaro.org>, "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: virtio-comment@lists.oasis-open.org, Vincent Guittot <vincent.guittot@linaro.org>, Bill Mills <bill.mills@linaro.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>
List-ID: <virtio-comment.lists.oasis-open.org>


=E5=9C=A8 2021/6/4 =E4=B8=8B=E5=8D=888:58, Viresh Kumar =E5=86=99=E9=81=93:
> On Fri, 4 Jun 2021 at 17:55, Enrico Weigelt, metux IT consult
> <lkml@metux.net>  wrote:
>> On 04.06.21 10:09, Viresh Kumar wrote:
> \\> > +\begin{lstlisting}
>>> +struct virtio_gpio_config {
>>> +    char name[32];
>>> +    u16 ngpio;
>>> +    u16 padding;
>>> +    u32 gpio_names_size;
>>> +    char gpio_names[0];
>>> +} __attribute__((packed));
>>> +\end{lstlisting}
>> oh no, please don't change the structs. the original one was:
>>
>> struct virtio_gpio_config {
>>           __u8    version;
>>           __u8    reserved0;
>>           __u16   num_gpios;
>>           __u32   names_size;
>>           __u8    reserved1[24];
>>           __u8    name[32];
>> };
>>
>> The version is vital - we need an upgrade path for future extensions.
>> (eg. bulk operations)
> I did wonder about how versioning works in general for virtio and couldn'=
t find
> much for any device specification there.
>
> Does anyone know how we handle different versions of the spec? Or is it l=
eft
> for the individual protocols, GPIO in this case ?


The spec define some general features and it also allow device to=20
implement its own features.

I guess in this case, it might be just a feature like VIRTIO_GPIO_F_BULK?

I'm not familiar with GPIO, but a question is, consider we have=20
virtqueue, so actually bulking is already supported?

Thanks


>
> Sure I will add it back, just wanted to get this disucussion going.
>


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

