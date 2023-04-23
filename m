Return-Path: <virtio-comment-return-5575-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAC4C77B76
	for <virtio-comment@archiver.kernel.org>; Sun, 23 Apr 2023 11:31:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 973DF2AD65
	for <virtio-comment@archiver.kernel.org>; Sun, 23 Apr 2023 11:31:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7EB8B98469A
	for <virtio-comment@archiver.kernel.org>; Sun, 23 Apr 2023 11:31:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6D28198413F; Sun, 23 Apr 2023 11:31:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 579EE985FE5
	for <virtio-comment@lists.oasis-open.org>; Sun, 23 Apr 2023 11:31:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682249492; x=1684841492;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mHBc9ljvGdkokWrMXfjnEiUc3rRFUiqeQV4BNOaHL4M=;
        b=hqztcQDhtwMBOa/rdkg+XPDLFqxwB7JkHyMQ9JA6cy019pDXyw80Xz91AlMfw5yHus
         GNeevaCpRwHGlDxPhFZrDF6jgfvQ6clXcnaTpQcYmDqnDW3nLULO8iYfKeSH+AV8j9iO
         qf52ugGUPZDfK+1ApIxVzccxl+06GJyeD1+JkVvIuBUMopKIg+DglUBVceLVN13iTNFj
         f9IVgjUc6wMyWZ5cD4qIsqzuqg+08f6gBXzh9Wg2ixHxPLfVvbbgx8VX6c1CM49go/mS
         YVxr2vkW/wVDW9rs92pUPhYSWpGMISyFzFHdsbB6RP9dNFdtTOie5nS+s+KMTg9L5/WQ
         mqyA==
X-Gm-Message-State: AAQBX9ch/cZ0iOgVtkBf2ADau3aC0ltSPEcXXQpPDKypmMS0YKufLHoA
	3sRrbOpD+KX2fl64idq7N6f2zQ==
X-Google-Smtp-Source: AKy350ZDg4KWwxqyGJtaAiiE+LmaZ3mHUuIxwxfxDpZXl5PwsDfXwyH+pziMS3j2lSigtrc9Ul1dJA==
X-Received: by 2002:a17:90b:3912:b0:246:a599:1ccd with SMTP id ob18-20020a17090b391200b00246a5991ccdmr10479085pjb.16.1682249492136;
        Sun, 23 Apr 2023 04:31:32 -0700 (PDT)
Message-ID: <1ab0beff-8b18-7a94-1a68-6bf36bcd0394@bytedance.com>
Date: Sun, 23 Apr 2023 19:29:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, parav@nvidia.com
Cc: virtio-dev@lists.oasis-open.org,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "helei.sig11@bytedance.com" <helei.sig11@bytedance.com>, houp@yusur.tech
From: zhenwei pi <pizhenwei@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [virtio-comment] [PROPOSAL] Virtio Over Fabrics(TCP/RDMA)

Hi,

In the past years, virtio supports lots of device specifications by 
PCI/MMIO/CCW. These devices work fine in the virtualization environment, 
and we have a chance to support virtio device family for the 
container/host scenario.

- Theory
"Virtio Over Fabrics" aims at "reuse virtio device specifications", and 
provides network defined peripheral devices.
And this protocol also could be used in virtualization environment, 
typically hypervisor(or vhost-user process) handles request from virtio 
PCI/MMIO/CCW, remaps request and forwards to target by fabrics.

- Protocol
The detail protocol definition see:
https://github.com/pizhenwei/linux/blob/virtio-of-github/include/uapi/linux/virtio_of.h

Example of virtio-blk read/write by TCP/RDMA:
1. Virtio Over TCP
1.1 An example of virtio-blk write(8K) command:
Initiator side sends a stream buffer(command + 4 * desc + 8208 bytes):
  COMMAND            +------+
                     |opcode|  ->  virtio_of_op_vring
                     +------+
                     |cmd id|  ->  10
                     +------+
                     |length|  ->  8208
                     +------+
                     |ndesc |  ->  4
                     +------+
                     |rsvd  |
                     +------+

  DESC0              +------+
               +-----|addr  |  -> 0
               |     +------+
               |     |length|  -> 16 (virtio blk write command)
               |     +------+
               |     |id    |  -> 10
               |     +------+
               |     |flags |  -> VRING_DESC_F_NEXT
               |     +------+
               |
  DESC1        |     +------+
               | +---|addr  |  -> 16
               | |   +------+
               | |   |length|  -> 4096
               | |   +------+
               | |   |id    |  -> 11
               | |   +------+
               | |   |flags |  -> VRING_DESC_F_NEXT
               | |   +------+
               | |
  DESC2        | |   +------+
               | |   |addr  |  -> 4112
               | |   +------+
               | | +-|length|  -> 4096
               | | | +------+
               | | | |id    |  -> 12
               | | | +------+
               | | | |flags |  -> VRING_DESC_F_NEXT
               | | | +------+
               | | |
  DESC3        | | | +------+
               | | | |addr  |  -> 0
               | | | +------+
               | | | |length|  -> 1
               | | | +------+
               | | | |id    |  -> 13
               | | | +------+
               | | | |flags |  -> VRING_DESC_F_WRITE
               | | | +------+
               | | |
  DATA         +-+-+>+------+  -> 0
                 | | |......|
                 +-+>+------+  -> 16
                   | |......|
                   +>+------+  -> 4112
                     |......|
                     +------+  -> 8208

Target side sends a stream buffer(completion + 1 * desc + 1 bytes):
  COMPLETION         +------+
                     |status|  ->  VIRTIO_OF_SUCCESS
                     +------+
                     |cmd id|  ->  10
                     +------+
                     |ndesc |  ->  1
                     +------+
                     |rsvd  |
                     +------+
                     |value |  -> 1 (value.u32)
                     +------+

  DESC0              +------+
                   +-|addr  |  -> 0
                   | +------+
                   | |length|  -> 1
                   | +------+
                   | |id    |  -> 13
                   | +------+
                   | |flags |  -> VRING_DESC_F_WRITE
                   | +------+
                   |
  DATA             |>+------+  -> 0
                     |......|
                     +------+  -> 1

1.2 An example of virtio-blk read(8K) command:
Initiator side sends a stream buffer(command + 4 * desc + 16 bytes):
  COMMAND            +------+
                     |opcode|  ->  virtio_of_op_vring
                     +------+
                     |cmd id|  ->  14
                     +------+
                     |length|  ->  16 (virtio blk read command)
                     +------+
                     |ndesc |  ->  4
                     +------+
                     |rsvd  |
                     +------+

  DESC0              +------+
                   +-|addr  |  -> 0
                   | +------+
                   | |length|  -> 16
                   | +------+
                   | |id    |  -> 14
                   | +------+
                   | |flags |  -> VRING_DESC_F_NEXT
                   | +------+
                   |
  DESC1            | +------+
                   | |addr  |  -> 16
                   | +------+
                   | |length|  -> 4096
                   | +------+
                   | |id    |  -> 15
                   | +------+
                   | |flags |  -> VRING_DESC_F_NEXT | VRING_DESC_F_WRITE
                   | +------+
                   |
  DESC2            | +------+
                   | |addr  |  -> 4112
                   | +------+
                   | |length|  -> 4096
                   | +------+
                   | |id    |  -> 16
                   | +------+
                   | |flags |  -> VRING_DESC_F_NEXT | VRING_DESC_F_WRITE
                   | +------+
                   |
  DESC3            | +------+
                   | |addr  |  -> 0
                   | +------+
                   | |length|  -> 1
                   | +------+
                   | |id    |  -> 17
                   | +------+
                   | |flags |  -> VRING_DESC_F_WRITE
                   | +------+
                   |
  DATA             +>+------+  -> 0
                     |......|
                     +------+  -> 16

Target side sends a stream buffer(completion + 3 * desc + 8193 bytes):
  COMPLETION         +------+
                     |status|  ->  VIRTIO_OF_SUCCESS
                     +------+
                     |cmd id|  ->  14
                     +------+
                     |ndesc |  ->  3
                     +------+
                     |rsvd  |
                     +------+
                     |value |  -> 8193 (value.u32)
                     +------+

  DESC0              +------+
               +-----|addr  |  -> 0
               |     +------+
               |     |length|  -> 4096
               |     +------+
               |     |id    |  -> 15
               |     +------+
               |     |flags |  -> VRING_DESC_F_NEXT | VRING_DESC_F_WRITE
               |     +------+
               |
  DESC1        |     +------+
               | +---|addr  |  -> 4096
               | |   +------+
               | |   |length|  -> 4096
               | |   +------+
               | |   |id    |  -> 16
               | |   +------+
               | |   |flags |  -> VRING_DESC_F_NEXT | VRING_DESC_F_WRITE
               | |   +------+
               | |
  DESC2        | |   +------+
               | |   |addr  |  -> 8192
               | |   +------+
               | | +-|length|  -> 1
               | | | +------+
               | | | |id    |  -> 17
               | | | +------+
               | | | |flags |  -> VRING_DESC_F_WRITE
               | | | +------+
               | | |
  DATA         +-+-+>+------+  -> 0
                 | | |......|
                 +-+>+------+  -> 4096
                   | |......|
                   +>+------+  -> 8192
                     |......|
                     +------+  -> 8193

1. Virtio Over RDMA
2.1 An example of virtio-blk write(8K) command:
Initiator side sends a message (command + 4 * desc) by RDMA POST SEND:
  COMMAND            +------+
                     |opcode|  ->  virtio_of_op_vring
                     +------+
                     |cmd id|  ->  10
                     +------+
                     |length|  ->  0
                     +------+
                     |ndesc |  ->  4
                     +------+
                     |rsvd  |
                     +------+

  DESC0              +------+
                     |addr  |  -> 0xffff012345670000
                     +------+
                     |length|  -> 16 (virtio blk write command)
                     +------+
                     |id    |  -> 10
                     +------+
                     |flags |  -> VRING_DESC_F_NEXT
                     +------+
                     |key   |  -> 0x1234
                     +------+

  DESC1              +------+
                     |addr  |  -> 0xffff012345671000
                     +------+
                     |length|  -> 4096
                     +------+
                     |id    |  -> 11
                     +------+
                     |flags |  -> VRING_DESC_F_NEXT
                     +------+
                     |key   |  -> 0x1236
                     +------+

  DESC2              +------+
                     |addr  |  -> 0xffff012345673000
                     +------+
                     |length|  -> 4096
                     +------+
                     |id    |  -> 12
                     +------+
                     |flags |  -> VRING_DESC_F_NEXT
                     +------+
                     |key   |  -> 0x1238
                     +------+

  DESC3              +------+
                     |addr  |  -> 0xffff012345677000
                     +------+
                     |length|  -> 1
                     +------+
                     |id    |  -> 13
                     +------+
                     |flags |  -> VRING_DESC_F_WRITE
                     +------+
                     |key   |  -> 0x1239
                     +------+

Target side reads the remote address of DESC0/DESC1/DESC2 by RDMA POST 
READ, and writes the remote address of DESC3 by RDMA POST WRITE, sends a 
completion by POST SEND:
  COMPLETION         +------+
                     |status|  ->  VIRTIO_OF_SUCCESS
                     +------+
                     |cmd id|  ->  10
                     +------+
                     |ndesc |  ->  0
                     +------+
                     |rsvd  |
                     +------+
                     |value |  -> 1 (value.u32)
                     +------+

2.2 An example of virtio-blk read(8K) command:
This is quite similar to 2.1 except flags in DESC1/DESC2, target side 
reads the remote address of DESC0 by RDMA POST READ, and writes the 
remote address of DESC1/DESC2/DESC3 by RDMA POST WRITE, sends a 
completion by POST SEND.

- Example
I develop an kernel initiator(unstable, WIP version, currently TCP/RDMA 
supported):
https://github.com/pizhenwei/linux/tree/virtio-of-github

And a target(unstable, WIP version, currently blk/crypto/rng supported):
https://github.com/pizhenwei/virtio-target/tree/WIP

Run target firstly: ~# ./vtgt vtgt.conf
Then install kernel modules in initiator side:
  ~# insmod ./virtio_fabrics.ko
  ~# insmod ./virtio_tcp.ko
  ~# insmod ./virtio_rdma.ko

Create a virtio-blk device over TCP by command:
  ~# echo 
command=create,transport=tcp,taddr=192.168.122.1,tport=15771,tvqn=virtio-target/block/block0.service,iaddr=192.168.122.1,iport=0,ivqn=vqn.uuid:42761df9-4c3f-4b27-843d-c88d1dcdce32 
 > /dev/virtio-fabrics

Or create a virtio-crypto device over RDMA by command:
  ~# echo 
command=create,transport=rdma,taddr=192.168.122.1,tport=15771,tvqn=virtio-target/crypto/crypto0.service,iaddr=192.168.122.1,iport=0,ivqn=vqn.uuid:42761df9-4c3f-4b27-843d-c88d1dcdce32 
 > /dev/virtio-fabrics

Or destroy a virtio-of device by command:
  ~# echo 
command=destroy,transport=tcp,taddr=192.168.122.1,tport=15771,tvqn=vqn.uuid:2d5130d8-36d5-4fe8-ae55-48ea51e0391a,iaddr=192.168.122.1,ivqn=vqn.uuid:42761df9-4c3f-4b27-843d-c88d1dcdce32 
 > /dev/virtio-fabrics

-- 
zhenwei pi

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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

