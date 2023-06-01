Return-Path: <virtio-comment-return-6067-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E10C77B7A
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 13:09:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 117FC37101
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 13:09:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 07D8998661C
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 13:09:59 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 002F7986608; Thu,  1 Jun 2023 13:09:59 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E460D986611
	for <virtio-comment@lists.oasis-open.org>; Thu,  1 Jun 2023 13:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685624994; x=1688216994;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vw4zncncs1nd68EZ5+AwW/BVWZdPtY8kT0+HhNl1+38=;
        b=jRKRp9FzB1m97elLLTphdEtmTuAuhX8A2S8eyWC/f7yarmtKC1CujQlkBTae/5Qr2F
         fsC1xQ5CRpPcdFPySEGDWhOtjaxc/eBFfC/fp5bo21sWXRg+OGCnIRWaSpLYGdDmpM2D
         p+LTE/b0J06Z+8Krfw0cP8tH3O11P3tSokgxfA39LfRBkhkPonS5T+1LjvFFDSY96ePv
         MuJLbKz+KnvfjjKorwGXaRP1CO2lwi7wGGoU5JJEa9qKhY6deitBG2KZNcHcGcLol1Tj
         Bmdq/QN8TaSK6qClO8VOMlcLDSSeYsQ6zrL9idf0H9quDqjz863qB2q1oscWiyTnPNsw
         xlqg==
X-Gm-Message-State: AC+VfDzrtr7IvXNTnlri/tS72qBcFuhLFd3+xhPIh+c27/VNGURuqTuI
	3vVQwoBdE0q8gUSPmgPX45Q2pw==
X-Google-Smtp-Source: ACHHUZ4DSuYR6A65M8yHGiMw1r3OmIJFPNzL6I+qjXVLeHhzpEdN3i+1VeUcR9fbKuZBPPhQS4iAKw==
X-Received: by 2002:a17:902:e5c9:b0:1ac:3780:3a76 with SMTP id u9-20020a170902e5c900b001ac37803a76mr7120729plf.4.1685624993969;
        Thu, 01 Jun 2023 06:09:53 -0700 (PDT)
Message-ID: <4426aa84-f22a-f361-af44-561dfd5a4ea0@bytedance.com>
Date: Thu, 1 Jun 2023 21:09:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-6-pizhenwei@bytedance.com>
 <20230531162048.GG1248296@fedora>
 <aad519cd-5114-6144-8520-a258745c5e4a@bytedance.com>
 <20230601113322.GA1538357@fedora>
Content-Language: en-US
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20230601113322.GA1538357@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Re: [virtio-comment] Re: [PATCH v2 05/11] transport-fabrics:
 introduce Keyed Transmission



On 6/1/23 19:33, Stefan Hajnoczi wrote:
> On Thu, Jun 01, 2023 at 05:02:45PM +0800, zhenwei pi wrote:
>>
>>
>> On 6/1/23 00:20, Stefan Hajnoczi wrote:
>>> On Thu, May 04, 2023 at 04:19:04PM +0800, zhenwei pi wrote:
>>>> Keyed transmission is used for message oriented communication(Ex RDMA),
>>>> also add virtio-blk read/write 8K example.
>>>>
>>>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>>>> ---
>>>>    transport-fabrics.tex | 178 ++++++++++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 178 insertions(+)
>>>>
>>>> diff --git a/transport-fabrics.tex b/transport-fabrics.tex
>>>> index c02cf26..7711321 100644
>>>> --- a/transport-fabrics.tex
>>>> +++ b/transport-fabrics.tex
>>>> @@ -317,3 +317,181 @@ \subsubsection{Buffer Mapping Definition}\label{sec:Virtio Transport Options / V
>>>>                        |......|
>>>>                        +------+  -> 8193
>>>>    \end{lstlisting}
>>>> +
>>>> +\paragraph{Keyed Transmission}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Keyed Transmission}
>>>> +Command and Segment Descriptors are transmitted in a message within a
>>>> +connection, and buffer is transmitted by remote memory access.  The layout in message:
>>>
>>> With RDMA it is theoretically possible to implement virtqueues without
>>> messages in the data path (i.e. by using something similar to vring with
>>> RDMA). Why did you decide to use a mixed messages + RDMA approach
>>> instead of a 100% RDMA approach?
>>>
>>
>> Hi,
>>
>> To reduce networking RTT. From my experience, a single RDMA message(event
>> based) uses at least 6us.
>> This approach has a chance to send a command(include data segments) by 1
>> networking RTT, and receive a completion(include data segments) in 1
>> networking RTT. I tried to design a 100% RDMA approach(mapping a vring to
>> the remote side, the remote side accesses this vring by RDMA READ/WRITE),
>> but I failed to find an idea to achieve.
> 
> The goal is to minimize the number of RDMA transfers. Each area of
> memory should be located on the system that is polling constantly (busy
> waiting) and the other side occassionally sends an RDMA WRITE request.
> 
> This idea requires bi-directional RDMA where both initiator and target
> make memory accessible to the other side. Is this possible?
> 
> The target owns the Available Ring, a descriptor table similar to those
> used by the Split and Packed Virtqueue layouts that is used by the
> driver to submit virtqueue buffers to the device. The target sends a key
> to the Available Ring to the initiator during virtqueue setup. The
> initiator sends RDMA WRITEs that fill in virtqueue descriptors. Indirect
> descriptors are supported, but the target will need to use RDMA READs to
> load the indirect descriptor table, so there is overhead. Even regular
> non-indirect descriptors have overhead because an RDMA READ is required
> to read the payload. The best approach for small virtqueue elements is
> to inline the payload in the Available Ring descriptor so no additional
> RDMA transfers are needed (this achieves similar effect to your approach
> of using messages + RDMA, but with pure RDMA). The target polls the
> Available Ring to detect available buffers.
> 
> The initiator sends a key to the Used Ring to the target during
> virtqueue setup. The target sends RDMA WRITEs that fill in used
> elements. The initiator polls the Used Ring to detect used buffers.
> 
> I'm not sure if the Used Ring makes sense as RDMA memory. Maybe it's
> better to send a message over the reliable connection instead so that
> Used Buffer Notifications can support interrupts and not just polling.
> 

I guess RDMA WRITE WITH IMM would be fine for this approach.

> This is a new virtqueue layout. It's only worthwhile implementing it if
> the Available Ring RDMA performance is significantly better than the
> current approach.
> 
> Stefan

I agree with your approach to maintain the Vring. If I understand correctly:
an example of virtio-blk write 4k:
1, initiator write the 3 vring desc by RDMA WRITE WITH IMM(IMM Data to 
carry VQ control message), this uses 1 networking RTT.
2, target handles WRITE WITH IMM, reads remote memory from initiator of 
desc[0] and desc[1]. This uses 1 networking RTT. (I did not find the 2 
keys of desc[0] and desc[1] from your approach, but I think this can be 
implemented in step 1 by adding another memory)
3, target handles virtio-blk write request and writes the memory to 
initiator of desc[2] by RDMA WRITE WITH IMM.(IMM Data to carry control 
message). This uses 1 networking RTT.


So we use at lease 3 RTT by this approach. If unfortunately the u32 
imm_data is lack to carry enough control message, we may need more RTT.

Sorry, the previous "I failed to find an idea to achieve." means that I 
failed to find an idea to complete 1 single request in 2 RTT.

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

