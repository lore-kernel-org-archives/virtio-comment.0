Return-Path: virtio-comment-return-1881-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0F6B9986575
	for <virtio-comment@lists.oasis-open.org>; Fri,  4 Jun 2021 10:58:06 +0000 (UTC)
References: <fe497091797c31f8b59a989fbd34b93fd07adce4.1622615811.git.viresh.kumar@linaro.org>
 <0f36102a-8ce0-8cda-cb3f-3b41b346fad9@metux.net>
 <e0bb902f-d009-8aa1-0c71-25989d3d1269@intel.com>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <3b8093bb-c348-cb74-1915-08bd98bf4007@metux.net>
Date: Fri, 4 Jun 2021 12:58:02 +0200
MIME-Version: 1.0
In-Reply-To: <e0bb902f-d009-8aa1-0c71-25989d3d1269@intel.com>
Subject: Re: [virtio-comment] Re: [PATCH] Reserve device id for GPIO device
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On 04.06.21 04:28, Jie Deng wrote:

> Has anyone ever tried to use GPIO in the guest to generate waveform ?
>=20
> When the frequency reaches a certain level, the waveform will become=20
> inaccurate
> due to the delay and uncertainty of the communication time between=20
> virtio frontend
> and backend. I'm not sure if any good solution for this case.

Wooow, that's something I didn't ever dared considering. How well that
works heavily depends on actual hardware (even on bare metal) and lots
of other factors.

Even on a bare metal Linux system, I wouldn't want userland do such
things via raw gpio devices - instead have specific (RT capable) kernel
drivers that expose themselves via some fitting hilevel subsys (eg. iio
or pwm). For those use cases, we should have specific protocols.

If it helps, we can add certain metadata, eg. timing constraints to the
line descriptions.


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

