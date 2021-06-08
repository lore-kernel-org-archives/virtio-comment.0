Return-Path: virtio-comment-return-1889-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3E7C998652F
	for <virtio-comment@lists.oasis-open.org>; Tue,  8 Jun 2021 11:02:51 +0000 (UTC)
References: <e687cd6bdafe1ad13205d99989163299649e20c9.1622794175.git.viresh.kumar@linaro.org>
 <db7ad3b4-36b5-1988-8f9a-b50a7e820150@metux.net>
 <CAKohpomU=0nO+yyywniZmLegvWSz9WdSf4jVwR=Z2J_XXoh8iA@mail.gmail.com>
 <66c30d89-c7ed-fc1a-fd0c-6ff188f675cb@redhat.com>
 <20210607054257.corogdevyxi3clt6@vireshk-i7>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <3bca063e-0a3c-2b21-2400-5e0138b3d3c3@metux.net>
Date: Tue, 8 Jun 2021 13:02:46 +0200
MIME-Version: 1.0
In-Reply-To: <20210607054257.corogdevyxi3clt6@vireshk-i7>
Subject: Re: [virtio-comment] [PATCH V2] virtio-gpio: add the device
 specification
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: quoted-printable
To: Viresh Kumar <viresh.kumar@linaro.org>, Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Vincent Guittot <vincent.guittot@linaro.org>, Bill Mills <bill.mills@linaro.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On 07.06.21 07:42, Viresh Kumar wrote:

>> I guess in this case, it might be just a feature like VIRTIO_GPIO_F_BULK=
?
>=20
> Oh yes, it makes sense. So we don't really need a _version_ here, but
> can just keep on adding more and more features.

If newly added features are orthogonal, that would do the job.

>> I'm not familiar with GPIO, but a question is, consider we have virtqueu=
e,
>> so actually bulking is already supported?
>=20
> Virtqueue is there yes, but we don't have operations here yet (in this
> version of the spec) which support setting 10 GPIO pins in output mode
> with a single request from driver to device.
>=20
> I think Enrico was looking to have a way to add provision for such
> operations later on if required.

Yes. Newer versions of the protocol could add more operations like
setting a bunch of gpios at once (only some HW really supports that, so
we yet have to sort out whether that should be blindly emulation by host
or refused - depending on how well this fits in to timing requirements).
Other new things could be configuring pullup/down (which has some
overlap with pinmux - some hw does it in the gpio controller, some by
separate pinmux), debounce filters, level thresholds, etc, etc ...

For now we're doing just the very basics - switch on/off, perhaps get an
irq if input changes. The more complex, not so common stuff is left for
future revisions. And to do that, we need to tell the driver what is
supported by the device.

If there's a more granular way instead of just a version number, am
very fine with that. (A little example would be very appreciated).

OTOH, I don't think that an practically not used version field does
hurt so bad.


--mtx

--=20
---
Hinweis: unverschl=C3=BCsselte E-Mails k=C3=B6nnen leicht abgeh=C3=B6rt und=
 manipuliert
werden ! F=C3=BCr eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schl=C3=BCssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287

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

