Return-Path: virtio-comment-return-1887-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0DAB4986362
	for <virtio-comment@lists.oasis-open.org>; Mon,  7 Jun 2021 15:11:58 +0000 (UTC)
References: <e687cd6bdafe1ad13205d99989163299649e20c9.1622794175.git.viresh.kumar@linaro.org>
 <db7ad3b4-36b5-1988-8f9a-b50a7e820150@metux.net>
 <20210607054553.7bjuiol44efr7dwz@vireshk-i7>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <9b1e3f8f-fbb1-1dab-1446-701e0d34f80d@metux.net>
Date: Mon, 7 Jun 2021 17:11:53 +0200
MIME-Version: 1.0
In-Reply-To: <20210607054553.7bjuiol44efr7dwz@vireshk-i7>
Subject: Re: [virtio-comment] [PATCH V2] virtio-gpio: add the device
 specification
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: quoted-printable
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: virtio-comment@lists.oasis-open.org, Vincent Guittot <vincent.guittot@linaro.org>, Bill Mills <bill.mills@linaro.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On 07.06.21 07:45, Viresh Kumar wrote:
> On 04-06-21, 14:25, Enrico Weigelt, metux IT consult wrote:
>> On 04.06.21 10:09, Viresh Kumar wrote:
>>> +The \field{VIRTIO_GPIO_REQ_GET_DIRECTION} request is initiated by the =
guest to
>>
>> Instead of "guest" we should call it "device", since virtio is also
>> meant for real hardware devices.
>=20
> Did you mean to say "driver" instead of "device" here ? The
> Virtio-device is the virtual hardware entity which is presented to the
> guest OS by the host OS. And the software talking to this device at
> the guest is called as the "driver".

Sorry, now I've mixed it up, too :o

The "host" in VM-terms is called "device" here (while the VM host
emulates the device), since the idea of virtio is it allows devices
also being implemented as real hardware (*1). Note that virtio is
actually a stack of multiple layers, eg. virtio device protocols is
separate from the underlying transport (eg. pcie, mmapped, ... *2).

> I have replaced "host" with "device" and "guest" with "driver" at as
> many places as possible. Thanks.

Yes, that seems correct. If we'd be looking from a pure hardware / bus
perspective, we might even call it "host" instead of "driver", but that
probably would totally confuse people looking from the VM
perspective.

--mtx


*1) If it was meant exclusively for VMs only, there had been lots of
     other ways to do that, which might even be more efficient in certain
     use cases.
*2) I'm actually planning some Linux-internal socket- or device-node
     based transport in order to allow separate userland servers for
     virtio-based devices, eg. for getting virgl running with containers.

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

