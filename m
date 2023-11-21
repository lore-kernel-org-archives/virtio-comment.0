Return-Path: <virtio-comment-return-8495-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02450C5ACB3
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 09:50:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3B6CA2AEE0
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 09:50:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1CF83986889
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 09:50:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id F4047986876; Tue, 21 Nov 2023 09:50:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C6081986877
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Nov 2023 09:50:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=Sophos;i="6.04,215,1695686400"; 
   d="scan'208";a="253866239"
X-Farcaster-Flow-ID: 5127501c-ecfc-444e-a805-1aecd6990308
Message-ID: <5ca9111f-067c-4e0a-9f33-1baf9ce0a1c6@amazon.com>
Date: Tue, 21 Nov 2023 10:50:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Alexander Graf <graf@amazon.com>
To: <virtio-comment@lists.oasis-open.org>
CC: Petre Eftime <petre.eftime@gmail.com>, "Michael S . Tsirkin"
	<mst@redhat.com>, Arnd Bergmann <arnd@arndb.de>
References: <20231025235345.17788-1-graf@amazon.com>
In-Reply-To: <20231025235345.17788-1-graf@amazon.com>
X-Originating-IP: [10.253.83.51]
X-ClientProxiedBy: EX19D046UWB003.ant.amazon.com (10.13.139.174) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64
Subject: Re: [virtio-comment] [PATCH] nsm: Add NSM description

Ck9uIDI2LjEwLjIzIDAxOjUzLCBBbGV4YW5kZXIgR3JhZiB3cm90ZToKPiBUaGUgdmlydGlvIE5p
dHJvU2VjdXJlTW9kdWxlIGlzIGEgZGV2aWNlIHdpdGggYSB2ZXJ5IHN0cmlwcGVkIGRvd24KPiBU
cnVzdGVkIFBsYXRmb3JtIE1vZHVsZSBmdW5jdGlvbmFsaXR5LCB3aGljaCBpcyB1c2VkIGluIHRo
ZQo+IGNvbnRleHQgb2YgYSBOaXRybyBFbmNsYXZlIChzZWUgXHVybHtodHRwczovL2xrbWwub3Jn
L2xrbWwvMjAyMC80LzIxLzEwMjB9KQo+IHRvIHByb3ZpZGUgYm9vdCB0aW1lIG1lYXN1cmVtZW50
IGFuZCBhdHRlc3RhdGlvbi4KPgo+IFRoaXMgcGF0Y2ggZGVzY3JpYmVzIHRoZSBjb21tdW5pY2F0
aW9uIHByb3RvY29sIGJldHdlZW4gZGV2aWNlIGFuZAo+IGRyaXZlciBmb3IgdGhlIE5pdHJvU2Vj
dXJlTW9kdWxlIHZpcnRpbyBkZXZpY2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgR3Jh
ZiA8Z3JhZkBhbWF6b24uY29tPgoKCkZyaWVuZGx5IHBpbmcgOikKCgpBbGV4CgoKCgoKQW1hem9u
IERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVy
bGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgSm9uYXRoYW4gV2Vp
c3MKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0
OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoK


