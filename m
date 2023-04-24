Return-Path: <virtio-comment-return-5576-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99F0C77B61
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 03:40:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F2A2C2ACA9
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 03:40:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C659F986367
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 03:40:23 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B0EAF986337; Mon, 24 Apr 2023 03:40:23 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9628498633A
	for <virtio-comment@lists.oasis-open.org>; Mon, 24 Apr 2023 03:40:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: XhyX5kxvO0-HaREosXM4HQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682307619; x=1684899619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wuZJL9LWQ8Q33pCWnBJVjHN/F1FeuII4vlpasY6dVZY=;
        b=GoN8hFvhoiVtIV23AZZJB9mVEt8tweAjpE4310P9JpDtXaUiLxBKYhxXOhIH4NuMUY
         xBvfPSPzYAI00ZxOK2Nk2ULSXqpADCLtLYwPZ0Qu4eyp0m9A8OVppPWcYOu9N7awcGUb
         pZ0N00wCX6gDozBrY6hYnSA/VluhO6Z83EmAk+JbXNTnjQ+qT6AarF5MwORo/2DYWO62
         oQ5gmFRcCgiC36rkMTBBxBYZG0SJ6y9ozRmjAGZPF3oU9EVy2xx5zZ/YEV5t1yfjnni2
         3UXy0HHZd7HdPNJUON5AWIHboE1aIH9zx13iSvjIZOVussSfLDpCZTbxVVQp4E0jZY3k
         bHvg==
X-Gm-Message-State: AAQBX9cCt2fI590CmjuUOiN5/modOquaYmitvkKtdD32BrA+cWYLwS6K
	M1Tczjb0S11V5ulSOE+CPperPGMOaIpoKfneNO4mqM5ZIUHSWDFaN+ZPWMaeA1et8L5p63r+t/4
	PTUbc4Aadb8JS+KXc7ZlQnEN341Mq5RrUdbBT409CiI23oYPbyQ==
X-Received: by 2002:a05:6820:410:b0:547:7a04:fca with SMTP id o16-20020a056820041000b005477a040fcamr2224819oou.3.1682307619410;
        Sun, 23 Apr 2023 20:40:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y9ldlgYWXUxhpJNGDQPZpxp5bf6kY40ERQqWeDP0U83OJvn53drw5BYrVAKOAv5fHtiVJ5OrZl4sgSRo9/vFA=
X-Received: by 2002:a05:6820:410:b0:547:7a04:fca with SMTP id
 o16-20020a056820041000b005477a040fcamr2224811oou.3.1682307619081; Sun, 23 Apr
 2023 20:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <1ab0beff-8b18-7a94-1a68-6bf36bcd0394@bytedance.com>
In-Reply-To: <1ab0beff-8b18-7a94-1a68-6bf36bcd0394@bytedance.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 24 Apr 2023 11:40:02 +0800
Message-ID: <CACGkMEvh+G2Tm=WDTOK3K2GO8c2dQ4y=UiKAk_kvsid2MGzbGg@mail.gmail.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>, parav@nvidia.com, 
	virtio-dev@lists.oasis-open.org, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"helei.sig11@bytedance.com" <helei.sig11@bytedance.com>, houp@yusur.tech
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PROPOSAL] Virtio Over Fabrics(TCP/RDMA)

On Sun, Apr 23, 2023 at 7:31=E2=80=AFPM zhenwei pi <pizhenwei@bytedance.com=
> wrote:
>
> Hi,
>
> In the past years, virtio supports lots of device specifications by
> PCI/MMIO/CCW. These devices work fine in the virtualization environment,
> and we have a chance to support virtio device family for the
> container/host scenario.

PCI can work for containers for sure (or does it meet any issue like
scalability?). It's better to describe what problems you met and why
you choose this way to solve it.

It's better to compare this with

1) hiding the fabrics details via DPU
2) vDPA

>
> - Theory
> "Virtio Over Fabrics" aims at "reuse virtio device specifications", and
> provides network defined peripheral devices.
> And this protocol also could be used in virtualization environment,
> typically hypervisor(or vhost-user process) handles request from virtio
> PCI/MMIO/CCW, remaps request and forwards to target by fabrics.

This requires meditation in the datapath, isn't it?

>
> - Protocol
> The detail protocol definition see:
> https://github.com/pizhenwei/linux/blob/virtio-of-github/include/uapi/lin=
ux/virtio_of.h

I'd say a RFC patch for virtio spec is more suitable than the codes.

>
> Example of virtio-blk read/write by TCP/RDMA:
> 1. Virtio Over TCP
> 1.1 An example of virtio-blk write(8K) command:
> Initiator side sends a stream buffer(command + 4 * desc + 8208 bytes):
>   COMMAND            +------+
>                      |opcode|  ->  virtio_of_op_vring
>                      +------+
>                      |cmd id|  ->  10
>                      +------+
>                      |length|  ->  8208
>                      +------+
>                      |ndesc |  ->  4
>                      +------+
>                      |rsvd  |
>                      +------+
>
>   DESC0              +------+
>                +-----|addr  |  -> 0
>                |     +------+
>                |     |length|  -> 16 (virtio blk write command)
>                |     +------+
>                |     |id    |  -> 10
>                |     +------+
>                |     |flags |  -> VRING_DESC_F_NEXT
>                |     +------+
>                |
>   DESC1        |     +------+
>                | +---|addr  |  -> 16
>                | |   +------+
>                | |   |length|  -> 4096
>                | |   +------+
>                | |   |id    |  -> 11
>                | |   +------+
>                | |   |flags |  -> VRING_DESC_F_NEXT
>                | |   +------+
>                | |
>   DESC2        | |   +------+
>                | |   |addr  |  -> 4112
>                | |   +------+
>                | | +-|length|  -> 4096
>                | | | +------+
>                | | | |id    |  -> 12
>                | | | +------+
>                | | | |flags |  -> VRING_DESC_F_NEXT
>                | | | +------+
>                | | |
>   DESC3        | | | +------+
>                | | | |addr  |  -> 0
>                | | | +------+
>                | | | |length|  -> 1
>                | | | +------+
>                | | | |id    |  -> 13
>                | | | +------+
>                | | | |flags |  -> VRING_DESC_F_WRITE
>                | | | +------+
>                | | |
>   DATA         +-+-+>+------+  -> 0
>                  | | |......|
>                  +-+>+------+  -> 16
>                    | |......|
>                    +>+------+  -> 4112
>                      |......|
>                      +------+  -> 8208
>
> Target side sends a stream buffer(completion + 1 * desc + 1 bytes):
>   COMPLETION         +------+
>                      |status|  ->  VIRTIO_OF_SUCCESS
>                      +------+
>                      |cmd id|  ->  10
>                      +------+
>                      |ndesc |  ->  1
>                      +------+
>                      |rsvd  |
>                      +------+
>                      |value |  -> 1 (value.u32)
>                      +------+
>
>   DESC0              +------+
>                    +-|addr  |  -> 0
>                    | +------+
>                    | |length|  -> 1
>                    | +------+
>                    | |id    |  -> 13
>                    | +------+
>                    | |flags |  -> VRING_DESC_F_WRITE
>                    | +------+
>                    |
>   DATA             |>+------+  -> 0
>                      |......|
>                      +------+  -> 1
>
> 1.2 An example of virtio-blk read(8K) command:
> Initiator side sends a stream buffer(command + 4 * desc + 16 bytes):
>   COMMAND            +------+
>                      |opcode|  ->  virtio_of_op_vring
>                      +------+
>                      |cmd id|  ->  14
>                      +------+
>                      |length|  ->  16 (virtio blk read command)
>                      +------+
>                      |ndesc |  ->  4
>                      +------+
>                      |rsvd  |
>                      +------+
>
>   DESC0              +------+
>                    +-|addr  |  -> 0
>                    | +------+
>                    | |length|  -> 16
>                    | +------+
>                    | |id    |  -> 14
>                    | +------+
>                    | |flags |  -> VRING_DESC_F_NEXT
>                    | +------+
>                    |
>   DESC1            | +------+
>                    | |addr  |  -> 16
>                    | +------+
>                    | |length|  -> 4096
>                    | +------+
>                    | |id    |  -> 15
>                    | +------+
>                    | |flags |  -> VRING_DESC_F_NEXT | VRING_DESC_F_WRITE
>                    | +------+
>                    |
>   DESC2            | +------+
>                    | |addr  |  -> 4112
>                    | +------+
>                    | |length|  -> 4096
>                    | +------+
>                    | |id    |  -> 16
>                    | +------+
>                    | |flags |  -> VRING_DESC_F_NEXT | VRING_DESC_F_WRITE
>                    | +------+
>                    |
>   DESC3            | +------+
>                    | |addr  |  -> 0
>                    | +------+
>                    | |length|  -> 1
>                    | +------+
>                    | |id    |  -> 17
>                    | +------+
>                    | |flags |  -> VRING_DESC_F_WRITE
>                    | +------+
>                    |
>   DATA             +>+------+  -> 0
>                      |......|
>                      +------+  -> 16
>
> Target side sends a stream buffer(completion + 3 * desc + 8193 bytes):
>   COMPLETION         +------+
>                      |status|  ->  VIRTIO_OF_SUCCESS
>                      +------+
>                      |cmd id|  ->  14
>                      +------+
>                      |ndesc |  ->  3
>                      +------+
>                      |rsvd  |
>                      +------+
>                      |value |  -> 8193 (value.u32)
>                      +------+
>
>   DESC0              +------+
>                +-----|addr  |  -> 0
>                |     +------+
>                |     |length|  -> 4096
>                |     +------+
>                |     |id    |  -> 15
>                |     +------+
>                |     |flags |  -> VRING_DESC_F_NEXT | VRING_DESC_F_WRITE
>                |     +------+
>                |
>   DESC1        |     +------+
>                | +---|addr  |  -> 4096
>                | |   +------+
>                | |   |length|  -> 4096
>                | |   +------+
>                | |   |id    |  -> 16
>                | |   +------+
>                | |   |flags |  -> VRING_DESC_F_NEXT | VRING_DESC_F_WRITE
>                | |   +------+
>                | |
>   DESC2        | |   +------+
>                | |   |addr  |  -> 8192
>                | |   +------+
>                | | +-|length|  -> 1
>                | | | +------+
>                | | | |id    |  -> 17
>                | | | +------+
>                | | | |flags |  -> VRING_DESC_F_WRITE
>                | | | +------+
>                | | |
>   DATA         +-+-+>+------+  -> 0
>                  | | |......|
>                  +-+>+------+  -> 4096
>                    | |......|
>                    +>+------+  -> 8192
>                      |......|
>                      +------+  -> 8193
>
> 1. Virtio Over RDMA
> 2.1 An example of virtio-blk write(8K) command:
> Initiator side sends a message (command + 4 * desc) by RDMA POST SEND:
>   COMMAND            +------+
>                      |opcode|  ->  virtio_of_op_vring
>                      +------+
>                      |cmd id|  ->  10
>                      +------+
>                      |length|  ->  0
>                      +------+
>                      |ndesc |  ->  4
>                      +------+
>                      |rsvd  |
>                      +------+
>
>   DESC0              +------+
>                      |addr  |  -> 0xffff012345670000
>                      +------+
>                      |length|  -> 16 (virtio blk write command)
>                      +------+
>                      |id    |  -> 10
>                      +------+
>                      |flags |  -> VRING_DESC_F_NEXT
>                      +------+
>                      |key   |  -> 0x1234
>                      +------+
>
>   DESC1              +------+
>                      |addr  |  -> 0xffff012345671000
>                      +------+
>                      |length|  -> 4096
>                      +------+
>                      |id    |  -> 11
>                      +------+
>                      |flags |  -> VRING_DESC_F_NEXT
>                      +------+
>                      |key   |  -> 0x1236
>                      +------+
>
>   DESC2              +------+
>                      |addr  |  -> 0xffff012345673000
>                      +------+
>                      |length|  -> 4096
>                      +------+
>                      |id    |  -> 12
>                      +------+
>                      |flags |  -> VRING_DESC_F_NEXT
>                      +------+
>                      |key   |  -> 0x1238
>                      +------+
>
>   DESC3              +------+
>                      |addr  |  -> 0xffff012345677000
>                      +------+
>                      |length|  -> 1
>                      +------+
>                      |id    |  -> 13
>                      +------+
>                      |flags |  -> VRING_DESC_F_WRITE
>                      +------+
>                      |key   |  -> 0x1239
>                      +------+
>
> Target side reads the remote address of DESC0/DESC1/DESC2 by RDMA POST
> READ, and writes the remote address of DESC3 by RDMA POST WRITE, sends a
> completion by POST SEND:
>   COMPLETION         +------+
>                      |status|  ->  VIRTIO_OF_SUCCESS
>                      +------+
>                      |cmd id|  ->  10
>                      +------+
>                      |ndesc |  ->  0
>                      +------+
>                      |rsvd  |
>                      +------+
>                      |value |  -> 1 (value.u32)
>                      +------+
>
> 2.2 An example of virtio-blk read(8K) command:
> This is quite similar to 2.1 except flags in DESC1/DESC2, target side
> reads the remote address of DESC0 by RDMA POST READ, and writes the
> remote address of DESC1/DESC2/DESC3 by RDMA POST WRITE, sends a
> completion by POST SEND.
>
> - Example
> I develop an kernel initiator(unstable, WIP version, currently TCP/RDMA
> supported):
> https://github.com/pizhenwei/linux/tree/virtio-of-github

A quick glance at the code told me it's a mediation layer that convert
descriptors in the vring to the fabric specific packet. This is the
vDPA way.

If we agree virtio of fabic is useful, we need invent facilities to
allow building packet directly without bothering the virtqueue (the
API is layout independent anyhow).

Thanks

>
> And a target(unstable, WIP version, currently blk/crypto/rng supported):
> https://github.com/pizhenwei/virtio-target/tree/WIP
>
> Run target firstly: ~# ./vtgt vtgt.conf
> Then install kernel modules in initiator side:
>   ~# insmod ./virtio_fabrics.ko
>   ~# insmod ./virtio_tcp.ko
>   ~# insmod ./virtio_rdma.ko
>
> Create a virtio-blk device over TCP by command:
>   ~# echo
> command=3Dcreate,transport=3Dtcp,taddr=3D192.168.122.1,tport=3D15771,tvqn=
=3Dvirtio-target/block/block0.service,iaddr=3D192.168.122.1,iport=3D0,ivqn=
=3Dvqn.uuid:42761df9-4c3f-4b27-843d-c88d1dcdce32
>  > /dev/virtio-fabrics
>
> Or create a virtio-crypto device over RDMA by command:
>   ~# echo
> command=3Dcreate,transport=3Drdma,taddr=3D192.168.122.1,tport=3D15771,tvq=
n=3Dvirtio-target/crypto/crypto0.service,iaddr=3D192.168.122.1,iport=3D0,iv=
qn=3Dvqn.uuid:42761df9-4c3f-4b27-843d-c88d1dcdce32
>  > /dev/virtio-fabrics
>
> Or destroy a virtio-of device by command:
>   ~# echo
> command=3Ddestroy,transport=3Dtcp,taddr=3D192.168.122.1,tport=3D15771,tvq=
n=3Dvqn.uuid:2d5130d8-36d5-4fe8-ae55-48ea51e0391a,iaddr=3D192.168.122.1,ivq=
n=3Dvqn.uuid:42761df9-4c3f-4b27-843d-c88d1dcdce32
>  > /dev/virtio-fabrics
>
> --
> zhenwei pi
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

