Return-Path: <virtio-comment-return-8836-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0079BC46CD2
	for <virtio-comment@archiver.kernel.org>; Thu, 21 Dec 2023 03:45:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 649AC2B020
	for <virtio-comment@archiver.kernel.org>; Thu, 21 Dec 2023 03:45:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4322F986633
	for <virtio-comment@archiver.kernel.org>; Thu, 21 Dec 2023 03:45:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 25D3E983EB5; Thu, 21 Dec 2023 03:45:52 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 13EC49865B6;
	Thu, 21 Dec 2023 03:45:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0VywG7FR_1703130346;
Message-ID: <7fa1ca7b-17db-4f7f-a914-dfc7aac047c6@linux.alibaba.com>
Date: Thu, 21 Dec 2023 11:45:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>
References: <20231212032713-mutt-send-email-mst@kernel.org>
 <bfd25f86-4292-45d2-a7a2-fe61bde0edb4@linux.alibaba.com>
 <b739d275-3664-4509-8a91-f19690719475@linux.alibaba.com>
 <fafa078b-14f5-460d-b03e-122afb9156ba@linux.alibaba.com>
 <CACGkMEuCb13=-b1yMYi3NOehL+6eNWjWsmBHfcYho1w0HwpVBA@mail.gmail.com>
 <6d9353f7-2899-4ba9-8aef-2431c9362207@linux.alibaba.com>
 <CACGkMEsh9h_syGag48DL9rSSH2Yp4Ht-ES4gA-5rv16Lih_tJw@mail.gmail.com>
 <df90d58d-7e4e-44d7-8896-5fc5b131c164@linux.alibaba.com>
 <CACGkMEsxsLP=hnybYi2fiKXFq1U1zo+EuKnzfnbT3K_Wcrug5Q@mail.gmail.com>
 <68b0d00b-8b3b-4bd4-9e7c-c3b811dafd8c@linux.alibaba.com>
 <20231220020428-mutt-send-email-mst@kernel.org>
 <CACGkMEspotRCqjgNGbmBfR9SH8P_um4me7TVsomnaJ6Gc9pSmA@mail.gmail.com>
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <CACGkMEspotRCqjgNGbmBfR9SH8P_um4me7TVsomnaJ6Gc9pSmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [virtio-dev] Re: [virtio-comment] Re: [PATCH
 v5] virtio-net: device does not deliver partially checksummed packet and may
 validate the checksum



在 2023/12/21 上午9:34, Jason Wang 写道:
> On Wed, Dec 20, 2023 at 3:35 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>> On Wed, Dec 20, 2023 at 02:30:01PM +0800, Heng Qi wrote:
>>> But why are we discussing this?
>> I think basically at this point everyone is confused about what
>> the feature does. right now we have packets
>> with
>> #define VIRTIO_NET_HDR_F_NEEDS_CSUM     1       -> partial
>> #define VIRTIO_NET_HDR_F_DATA_VALID     2       -> unnecessary
>> and packets without either                      -> none
>>
>> if both 1 and 2 are set then linux uses VIRTIO_NET_HDR_F_NEEDS_CSUM but
>> I am not sure it's not a mistake. Maybe it does not matter.
>>
>> What does this new thing do? So far all we have is "XDP will turn it on"
>> which is not really sufficient. I assumed it somehow replaces
>> partial with complete.
> It looks not? CHECKSUM_COMPLETE is less optimal than
> CHECKSUM_UNNCESSARY as validation is still needed.
>
> If I understand correctly, this new thing wants DATA_VALID only.

Disable NEEDS_CSUM or calculate fully checksummed packets to fully 
checksummed packets (how this is done does not matter).
The driver will only receive two types of packets: CHECKSUM_NONE and 
DATA_VALID (CHECKSUM_UNNECESSARY).

Thanks！

>
> Thanks
>
>
>
>> That would make sense for many reasons,
>> for example the checksum fields in the header can be reused
>> for other purposes. But maybe not?
>>
>>
>> --
>> MST
>>


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

