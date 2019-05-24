Return-Path: virtio-comment-return-735-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 050D4985FCD
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 May 2019 09:35:52 +0000 (UTC)
References: <1556d65b-a036-491d-dae9-360e14fb5eb4@univention.de>
 <20190523233937-mutt-send-email-mst@kernel.org>
From: Philipp Hahn <hahn@univention.de>
Message-ID: <1988b2f8-04cc-0e15-17a1-55b9958a328b@univention.de>
Date: Fri, 24 May 2019 11:35:47 +0200
MIME-Version: 1.0
In-Reply-To: <20190523233937-mutt-send-email-mst@kernel.org>
Content-Type: multipart/mixed;
 boundary="------------8785B01EAB1E185BEBCD38F5"
Content-Language: en-US
Subject: Re: [virtio-comment] [ERRATUM?] 5.5.6.3 Memory Statistics: 6 -> 10
 byte
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

--------------8785B01EAB1E185BEBCD38F5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello Michael,

Am 24.05.19 um 05:39 schrieb Michael S. Tsirkin:
> On Thu, May 23, 2019 at 02:51:48PM +0200, Philipp Hahn wrote:
>> quoting
>> <https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.html#x1-2930003>:
>>
>>> Within the buffer, statistics are an array of 6-byte entries. 
>>                                                 ^
>>> Each statistic consists of a 16 bit tag and a 64 bit value.
>> ...
>>> struct virtio_balloon_stat { 
>> ...
>>>         le16 tag; 
>>>         le64 val; 
>>> } __attribute__((packed));
>>
>> If my calculation is right that is a (16 + 64) = 80 bits which is a
>> 10-byte sized entry - not 6-byte.
> 
> 
> Agreed. Want to open a github issue?

Sure, here it is: <https://github.com/oasis-tcs/virtio-spec/issues/45>

Patch attached and also available from
<https://github.com/univention/virtio-spec/commit/609dbbbe71fc9143c2849d2c9c2d481ec178ce30>

Philipp

--------------8785B01EAB1E185BEBCD38F5
Content-Type: text/x-patch;
 name="0001-Issue-45-Fix-Memory-Statistics-structure-size.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-Issue-45-Fix-Memory-Statistics-structure-size.patch"

From 609dbbbe71fc9143c2849d2c9c2d481ec178ce30 Mon Sep 17 00:00:00 2001
Message-Id: <609dbbbe71fc9143c2849d2c9c2d481ec178ce30.1558690397.git.hahn@univention.de>
From: Philipp Hahn <hahn@univention.de>
Date: Fri, 24 May 2019 11:29:17 +0200
Subject: [PATCH] Issue #45: Fix Memory Statistics structure size

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
---
 content.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/content.tex b/content.tex
index 193b6e1..dee1f28 100644
--- a/content.tex
+++ b/content.tex
@@ -4766,7 +4766,7 @@ \subsubsection{Memory Statistics}\label{sec:Device Types / Memory Balloon Device
   subsequent request) and consumes the statistics.
 \end{enumerate}
 
-  Within the buffer, statistics are an array of 6-byte entries.
+  Within the buffer, statistics are an array of 10-byte entries.
   Each statistic consists of a 16 bit
   tag and a 64 bit value. All statistics are optional and the
   driver chooses which ones to supply. To guarantee backwards
-- 
2.11.0



--------------8785B01EAB1E185BEBCD38F5
Content-Type: text/plain; charset=us-ascii


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
--------------8785B01EAB1E185BEBCD38F5--
