Return-Path: <virtio-comment-return-6083-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF8EC7EE23
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 00:57:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CF2152AF86
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 00:57:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B7D609867CF
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 00:57:14 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A8F86983FE6; Fri,  2 Jun 2023 00:57:14 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8F85E9867CA
	for <virtio-comment@lists.oasis-open.org>; Fri,  2 Jun 2023 00:57:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685667432; x=1688259432;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PqMHpptZeRHMFjG7CRQuvRhLg3UuzHrfgNOpj+h6jmE=;
        b=iirXC0GzohWjQfu+r0vV8zehdZBTRpM+S+rDGhnQ1U7iP7Q0Hzdh0BJWu3oFMVRik4
         RrcEMhtj2c8m4XSuOJhltaTWHPYZEYGOVyn8VMa37XZneetPMRZOPBIordZSGDSE5/KJ
         P0nUGIF96G3xRFTHVM+9t3nvras70AhOxj3vn3vm/5vmUMu84WkeQCtHaOOvQggE6wSe
         ASc/2lNC/r2+A4pKNB6ad7Jsp/0E3WvoGhOuYIIvaBcz9B/bEVrzozooKbQ6CCotjAuj
         4vEWAGswg2II8/iIhKjZQnif4i9Czb+GYB+2wcMdhiZ2gFNHC7MZGVXvoxtKSwypjqbx
         OSaQ==
X-Gm-Message-State: AC+VfDwRY+jjfREU9vhKVq79iyoE+PFoG+7dW8FgKDWAsr1rIrpH+SkM
	V4xjZXszAXBX7Xy2VNr5dhnxiA==
X-Google-Smtp-Source: ACHHUZ4gJcqbhDwauU7zDuyFyYT2c8+4ZBHR7Y349y3NjF723rTofKCxWEl4fXX67IfeNSkghwzb3A==
X-Received: by 2002:a17:90b:370a:b0:254:ce9e:53 with SMTP id mg10-20020a17090b370a00b00254ce9e0053mr703772pjb.23.1685667432348;
        Thu, 01 Jun 2023 17:57:12 -0700 (PDT)
Message-ID: <ced49494-1839-50d3-6742-0d5c1e7b33c7@bytedance.com>
Date: Fri, 2 Jun 2023 08:55:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-6-pizhenwei@bytedance.com>
 <20230531162048.GG1248296@fedora>
 <aad519cd-5114-6144-8520-a258745c5e4a@bytedance.com>
 <20230601113322.GA1538357@fedora>
 <4426aa84-f22a-f361-af44-561dfd5a4ea0@bytedance.com>
 <20230601191353.GC1622695@fedora> <20230601212339.GA1687473@fedora>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20230601212339.GA1687473@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Re: Re: [virtio-comment] Re: [PATCH v2 05/11] transport-fabrics:
 introduce Keyed Transmission



On 6/2/23 05:23, Stefan Hajnoczi wrote:
> On Thu, Jun 01, 2023 at 03:13:53PM -0400, Stefan Hajnoczi wrote:
>> On Thu, Jun 01, 2023 at 09:09:49PM +0800, zhenwei pi wrote:
>>> On 6/1/23 19:33, Stefan Hajnoczi wrote:
>>>> On Thu, Jun 01, 2023 at 05:02:45PM +0800, zhenwei pi wrote:
>>>>> On 6/1/23 00:20, Stefan Hajnoczi wrote:
>>>>>> On Thu, May 04, 2023 at 04:19:04PM +0800, zhenwei pi wrote:
>> One more idea to play with: VIRTIO has flexible message framing, so
>> devices must process a virtqueue buffer the same regardless of whether
>> it has 1 large element or many small elements. Therefore the virtqueue
>> RDMA protocol does not need to preserve the virtqueue element count and
>> sizes from the driver. For example, the target can offer a list of
>> key/length pairs that the initiator RDMA WRITES the virtqueue buffer
>> contents into. For a virtio-blk device that would be a struct
>> virtio_blk_outhdr followed by a large page-aligned buffer for the I/O
>> buffer data to be transferred. Then the device always a properly aligned
>> and contiguous buffer. Unfortunately this approach breaks down when the
>> virtqueue carries requests that are organized very differently, but it
>> might be useful when there is a most common request type.
> 
> I'm not sure if I explained this well. What I'm trying to say is that I
> think RDMA benefits when the receiver's memory constraints are visible
> to the sender. The sender performs RDMA WRITEs to the locations where
> the receiver can efficiently process the data.
> 
> This protocol proposal doesn't really take advantage of this approach
> because it communicates the virtqueue buffer elements from the initiator
> (the sender) to the target (the receiver). That's the wrong way around.
> 
> I have never used RDMA myself, so this might be wrong, but as long as
> the RDMA API allows the sender to specify a scatter-gather list as
> input, then I think the details of the virtqueue buffer elements that
> don't have the WRITE flag should never be communicated over the network.
> Instead the initiator should RDMA WRITE from the VIRTIO driver's
> scatter-gather list to the target's preferred destination instead.
> 
> Stefan

Hi,

I guess I followed your point. "the target can offer a list of 
key/length pairs that the initiator RDMA WRITES the virtqueue buffer 
contents into" seems not good to me, I'd prefer to expose RDMA memory 
region of initiator side only(target side uses RDMA READ/WRITE to 
operate the memory of initiator, this means target side has no need to 
allocate/pin memory buffer).

 From the point of my view, this protocol needs to be effective and 
maintainable, mapping vring mechanism with RDMA WRITE from 2 
directions(initiator to target, and target to initiator) leads high 
complexity ...

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

