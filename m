Return-Path: <virtio-comment-return-6063-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C22AC77B7E
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 09:05:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9A68729FD0
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 09:05:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9A531986615
	for <virtio-comment@archiver.kernel.org>; Thu,  1 Jun 2023 09:05:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 871D8983DE3; Thu,  1 Jun 2023 09:05:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 257AC986605
	for <virtio-comment@lists.oasis-open.org>; Thu,  1 Jun 2023 09:04:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685610295; x=1688202295;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mb2V/HQ6WFPfiiMJ1lA4IXhWABp++DcCV9KwAeJr8qI=;
        b=gx05ciUAW9X9uz0cFrW5YVEC+AJyPjcTYzI8rEgtXqGSDEPD8S4cRx1tmrsy3I9OoK
         9q4qWbAO9SpaA2/y71WtgmMT3BYASwoK7JHknIB3dFd0CLnU7jH+JGdwBDWGAGxiwfyQ
         29Fh2obrdmvJQUYE6nNad2M3epGV2tFIYkS7hF2CNzL5aodaPe2juQaUoXT42yRHSWxK
         EtF1Kw6pO+YldO9JZafn3qjAZELYVWZan3NmlBPgaSjBQ9rMe6HQz7VzKjhd51eII7Qn
         3JMLof1vBcZoUAxk+jIHXOMby+mPX09A+U4jR0Oy5TdeQqCeEakULef/W5AbeAqvI/S5
         yt6A==
X-Gm-Message-State: AC+VfDwEBPOQlzelH1KQFC5amPt+Cx/5RigHYk3fdDME7nv2Z1X76f0B
	qLpKQ/YauZpXjOoqfaZhBNm1b4omlrUwR3jSVYOuyJx6
X-Google-Smtp-Source: ACHHUZ4hX155BbYBZu3KUXN4VKH2npgMpRQKmKmmM9+imiNY7YtGeLLfBzwgFnkivKjYAJy+WPITpg==
X-Received: by 2002:a05:6a20:7f86:b0:104:2b4e:412d with SMTP id d6-20020a056a207f8600b001042b4e412dmr7151318pzj.6.1685610295085;
        Thu, 01 Jun 2023 02:04:55 -0700 (PDT)
Message-ID: <aad519cd-5114-6144-8520-a258745c5e4a@bytedance.com>
Date: Thu, 1 Jun 2023 17:02:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: virtio-comment@lists.oasis-open.org
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-6-pizhenwei@bytedance.com>
 <20230531162048.GG1248296@fedora>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20230531162048.GG1248296@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] Re: [PATCH v2 05/11] transport-fabrics:
 introduce Keyed Transmission



On 6/1/23 00:20, Stefan Hajnoczi wrote:
> On Thu, May 04, 2023 at 04:19:04PM +0800, zhenwei pi wrote:
>> Keyed transmission is used for message oriented communication(Ex RDMA),
>> also add virtio-blk read/write 8K example.
>>
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>> ---
>>   transport-fabrics.tex | 178 ++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 178 insertions(+)
>>
>> diff --git a/transport-fabrics.tex b/transport-fabrics.tex
>> index c02cf26..7711321 100644
>> --- a/transport-fabrics.tex
>> +++ b/transport-fabrics.tex
>> @@ -317,3 +317,181 @@ \subsubsection{Buffer Mapping Definition}\label{sec:Virtio Transport Options / V
>>                       |......|
>>                       +------+  -> 8193
>>   \end{lstlisting}
>> +
>> +\paragraph{Keyed Transmission}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Keyed Transmission}
>> +Command and Segment Descriptors are transmitted in a message within a
>> +connection, and buffer is transmitted by remote memory access.  The layout in message:
> 
> With RDMA it is theoretically possible to implement virtqueues without
> messages in the data path (i.e. by using something similar to vring with
> RDMA). Why did you decide to use a mixed messages + RDMA approach
> instead of a 100% RDMA approach?
> 

Hi,

To reduce networking RTT. From my experience, a single RDMA 
message(event based) uses at least 6us.
This approach has a chance to send a command(include data segments) by 1 
networking RTT, and receive a completion(include data segments) in 1 
networking RTT. I tried to design a 100% RDMA approach(mapping a vring 
to the remote side, the remote side accesses this vring by RDMA 
READ/WRITE), but I failed to find an idea to achieve.

>> +
>> +\begin{lstlisting}
>> +CMDx contains 0 descriptor, CMDy contains (n - m + 1) descriptors:
> 
> "0 descriptors"
> 
>> +
>> +     +-----+     +-----++-----+     +-----+
>> + ... | CMDx| ... | CMDy||DESCm| ... |DESCn| ...
>> +     +-----+     +-----++-----+     +-----+
>> +
>> +COMPx contains 0 descriptor, COMPy contains 0 descriptor:
> 
> "0 descriptors"

OK, I'll fix this in the next series. Thanks!

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

