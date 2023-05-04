Return-Path: <virtio-comment-return-5771-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4ED9C77B7C
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 10:12:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1BB9D370EB
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 10:12:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F1D579866B4
	for <virtio-comment@archiver.kernel.org>; Thu,  4 May 2023 10:12:40 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DBF96983EB5; Thu,  4 May 2023 10:12:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CA37A98663F
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 May 2023 10:12:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 0lvJl88xNS6hoVSpax2zBQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683195158; x=1685787158;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tzs7U4ZDGgL///gdZxPNBuhWAB3Dghjl/+2oSMStTKI=;
        b=ioGez3yXuYKDy69bbDy7R/AgPm7z5waB4I8YMqRxFnhAjRzeYqXRuv83XK3qaqNuQC
         X+ljnUvDlxK6qSzv/taUw+OnI0w6KNS0OwAMq2/akFdYnV9TONMG/VjhkD7+Zh0eXEYv
         f+6mwdxGWIND87ioC0CwJrESnJYNf0Uey+kTetTXfLwc8/hBdpt2FEMJZOrYxU+EAGta
         ms6H6QG76TMz83+s2KllPkBnXq1acd2NW0wKfit0E4eKcEYpgZBg9GCu76um46xxl18F
         55K7QkuQ634/tUYTXZcn+lTP4NplTRtkFQVk4MIFxnwqyac//DMOZ7rdt0PB77vsBsbj
         j+JA==
X-Gm-Message-State: AC+VfDzD10otkD1s5OHuXYCDYk5RLNH3QF+ERKAFkccOFzQPObBLcpOB
	6VbeUEG6Y2Lxytmyvd3rsdK4slFH5swUVEqbyxFQ4Ree3L8vmWsqSsDBxydakhD/9eSl0t2krxl
	OgW3bDdqumstzqPBm1U3w7jmL9XyU5LqO9Q==
X-Received: by 2002:a05:600c:2285:b0:3f0:b095:15d9 with SMTP id 5-20020a05600c228500b003f0b09515d9mr16212338wmf.40.1683195157818;
        Thu, 04 May 2023 03:12:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6vIKEQzN4IQ3PbHd9Cbb6wJETH1CR8l8dFxeONyGWF2gBosNrO2JrlkqePfaCgFoETVKlFww==
X-Received: by 2002:a05:600c:2285:b0:3f0:b095:15d9 with SMTP id 5-20020a05600c228500b003f0b09515d9mr16212322wmf.40.1683195157486;
        Thu, 04 May 2023 03:12:37 -0700 (PDT)
Message-ID: <b22c55dd-19a7-f455-de86-107e1d8d61fe@redhat.com>
Date: Thu, 4 May 2023 12:12:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: "Michael S. Tsirkin" <mst@redhat.com>,
 zhenwei pi <pizhenwei@bytedance.com>
Cc: parav@nvidia.com, stefanha@redhat.com, jasowang@redhat.com,
 virtio-comment@lists.oasis-open.org, houp@yusur.tech,
 helei.sig11@bytedance.com, xinhao.kong@duke.edu
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-2-pizhenwei@bytedance.com>
 <13c0e109-8d21-5294-6bd5-8f6fd6f707d2@redhat.com>
 <1a0b973a-11b0-6b24-f118-902a5809f7d1@bytedance.com>
 <20230504060313-mutt-send-email-mst@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230504060313-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] [PATCH v2 01/11] transport-fabrics: introduce
 Virtio Over Fabrics overview

On 04.05.23 12:05, Michael S. Tsirkin wrote:
> On Thu, May 04, 2023 at 05:46:46PM +0800, zhenwei pi wrote:
>>
>>
>> On 5/4/23 16:57, David Hildenbrand wrote:
>>> On 04.05.23 10:19, zhenwei pi wrote:
>>>> In the past years, virtio supports lots of device specifications by
>>>> PCI/MMIO/CCW. These devices work fine in the virtualization environment.
>>>>
>>>> Introduce Virtio Over Fabrics transport to support "network defined
>>>> peripheral devices". With this transport, Many Virtio based devices
>>>> transparently work over fabrics. Note that the balloon device may not
>>>> make sense. Shared memory regions won't work.
>>>
>>> Anything that involves memory (memory balloon, memory device, shared
>>> memory) is fully incompatible I would guess.
>>>
>>
>> Hi,
>>
>> Agree that memory device and shared memory is incompatible.
>>
>> But memory balloon device, I don't know if it's possible to use in future.
>> As far as I can imagine: a user process runs virtio-of target by listening
>> localhost, and memory balloon isolates same pages from kernel, the user
>> process maps these physical pages into virtual memory ...
> 
> I don't see anything big that is wrong with balloon. device inflates
> balloon, this memory is stolen from guest. isn't this what user
> wanted? presumably there's a way for device to send this
> information to the hypervisor otherwise it seems kind of
> pointless.

If it's really just about sending messages, then even virtio-mem would 
be possible I assume?

-- 
Thanks,

David / dhildenb


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

