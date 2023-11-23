Return-Path: <virtio-comment-return-8563-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1FEC61D85
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 07:45:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4C7332A82D
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 07:45:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3266B9868AF
	for <virtio-comment@archiver.kernel.org>; Thu, 23 Nov 2023 07:45:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 15EB29868A2; Thu, 23 Nov 2023 07:45:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 040FD9868A3
	for <virtio-comment@lists.oasis-open.org>; Thu, 23 Nov 2023 07:45:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
Message-ID: <a3b0fab2-ab7f-4831-a008-a2de4ba9b29f@163.com>
Date: Wed, 22 Nov 2023 23:45:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Gowrishankar Muthukrishnan <gmuthukrishn@marvell.com>
Cc: virtio-comment@lists.oasis-open.org, zhenwei pi
 <pizhenwei@bytedance.com>, Lei He <helei.sig11@bytedance.com>,
 Anoob Joseph <anoobj@marvell.com>, jerinj@marvell.com
References: <20230525073108.2579235-1-gmuthukrishn@marvell.com>
 <20230525053227-mutt-send-email-mst@kernel.org>
From: he lei <lhestz@163.com>
In-Reply-To: <20230525053227-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wCXz7MMA19lSePeBg--.56340S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyfXr17Xw4xGrW7Gw4fuFg_yoW8GFyfpF
	Z5Kwn0yan5G347Jas7Xa1rZry3ZFn5JrW5Cr12934Ut3Z0krZY9FW2kw45uF4fCr97Zr1j
	ya1qyw1DWa15ArJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRIdgXUUUUU=
X-Originating-IP: [61.48.14.170]
X-CM-SenderInfo: pokh23r26rljoofrz/xtbBlAwxK1gi4bB2YAABs+
Subject: Re: [virtio-comment] Re: [PATCH v1] virtio-crypto: add RSA private
 key types

On 2023/5/25 2:34, Michael S. Tsirkin wrote:
> On Thu, May 25, 2023 at 01:01:08PM +0530, Gowrishankar Muthukrishnan wrote:
>> With reference to RFC 3447 Section 3.2, private key exists in any of
>> the two forms, namely:
>>   - exponent
>>   - quintuple
>>
>> Following this, Appendix A.1.2 recommends private key represented
>> including both of the above representations. Hence, for a RSA op,
>> it is required to choose one of these types, hence proposing
>> two private key types.
Do we really need to differentiate between these two formats?
   - RSA Private keys in these two formats can be stored in the same 
RSAPrivateKey structure recommends at Appendix A.1.2 at the same time 
(exponet using n and d, and quintuple using p q...).
   - There is no requirement in the RFC document to distinguish whether 
the private key stored in RSAPrivateKey is in a certain format or both.
   - AFAIK, the implementation interfaces of nettle, gnutls, and openssl 
will not distinguish between these two formats, and will write the keys 
in both formats into rsaprivatekey when exporting the key.

>>
>> Signed-off-by: Gowrishankar Muthukrishnan <gmuthukrishn@marvell.com>
>> ---
>>   device-types/crypto/description.tex | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/device-types/crypto/description.tex b/device-types/crypto/description.tex


-- 
Best regards,
he lei
lhestz@163.com


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

