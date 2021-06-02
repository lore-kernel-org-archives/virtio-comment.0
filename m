Return-Path: virtio-comment-return-1873-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 223F498652B
	for <virtio-comment@lists.oasis-open.org>; Wed,  2 Jun 2021 11:57:16 +0000 (UTC)
References: <fe497091797c31f8b59a989fbd34b93fd07adce4.1622615811.git.viresh.kumar@linaro.org>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <0f36102a-8ce0-8cda-cb3f-3b41b346fad9@metux.net>
Date: Wed, 2 Jun 2021 13:57:12 +0200
MIME-Version: 1.0
In-Reply-To: <fe497091797c31f8b59a989fbd34b93fd07adce4.1622615811.git.viresh.kumar@linaro.org>
Subject: [virtio-comment] Re: [PATCH] Reserve device id for GPIO device
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: quoted-printable
To: Viresh Kumar <viresh.kumar@linaro.org>, virtio-comment@lists.oasis-open.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Bill Mills <bill.mills@linaro.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>
List-ID: <virtio-comment.lists.oasis-open.org>

On 02.06.21 08:42, Viresh Kumar wrote:
> Use device ID 41

Thanks for submitting that. I should have been my duty, but I've been
too busy w/ other things.

You've probably already seen my spec in the Linux virtio-gpio patch
queue. Feel free to texify it for submitting here. (*1)

Also please remind me to update the device id (need to fix kernel as
well as qemu side).


--mtx

*1)=20
https://github.com/metux/linux/commit/66c98eab3433a592b11d60d1a05c2609fee48=
11a
     https://github.com/metux/linux/tree/submit/virtio-gpio-2020-12-07-v3

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

