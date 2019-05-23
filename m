Return-Path: virtio-comment-return-733-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3BD18985FBB
	for <virtio-comment@lists.oasis-open.org>; Thu, 23 May 2019 12:51:52 +0000 (UTC)
From: Philipp Hahn <hahn@univention.de>
Message-ID: <1556d65b-a036-491d-dae9-360e14fb5eb4@univention.de>
Date: Thu, 23 May 2019 14:51:48 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [ERRATUM?] 5.5.6.3 Memory Statistics: 6 -> 10 byte
To: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

Hello,

quoting
<https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#x1-2930003>:

> Within the buffer, statistics are an array of 6-byte entries. 
                                                ^
> Each statistic consists of a 16 bit tag and a 64 bit value.
...
> struct virtio_balloon_stat { 
...
>         le16 tag; 
>         le64 val; 
> } __attribute__((packed));

If my calculation is right that is a (16 + 64) = 80 bits which is a
10-byte sized entry - not 6-byte.

Philipp
-- 
Philipp Hahn
Open Source Software Engineer

Univention GmbH
be open.
Mary-Somerville-Str. 1
D-28359 Bremen
Tel.: +49 421 22232-0
Fax : +49 421 22232-99
hahn@univention.de

http://www.univention.de/
Geschäftsführer: Peter H. Ganten
HRB 20755 Amtsgericht Bremen
Steuer-Nr.: 71-597-02876

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

