Return-Path: <virtio-comment-return-6084-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7DBC77B7E
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 01:20:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CB81F2AF9B
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 01:20:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AE3549867E1
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 01:20:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 95C7D9867D7; Fri,  2 Jun 2023 01:20:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2FB439867DA
	for <virtio-comment@lists.oasis-open.org>; Fri,  2 Jun 2023 01:19:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685668788; x=1688260788;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J1KTrLQTLqGMIwDhfKEQJjVbc76DoPHbLwEODP5m/+Q=;
        b=OcpadGLS6EfHj69uZmXZJre07ukYlhhX7WAdPWfWGFt6vXAfoI6W9+Af9zohVcstww
         6vSnugmyoir/vctWx+9xooekykyVEoSLxFbHhU/ehG1I9ArigHEcc+TMWfEdPptMgtsB
         v8mWZxtDIpXLCqQBFe8OUnK3VnoOLbUgz2bsn+uFE9fTz9trWEDHQsYYtCkMVCyllBrS
         uRHG2+rmdazsY3VBazu479nP0Eip6pXMJAruhK+pT237SKpC3+k1/Wuf0HUr6k9XzLsC
         55QurdSy1CORUGWMsh0wPQGIWsMel9rBzcY3C0d3oLwgn2WK60LnGx87zfPH65DhQOUV
         c+IA==
X-Gm-Message-State: AC+VfDzeilvtQakvOm+23T7X26faA5F3j39bEkTlxuhfVX98KBasw0yo
	n6izhRvpu2de+esaabo64Je+Tw==
X-Google-Smtp-Source: ACHHUZ6q1HNPd7JWS/o/z1iz7nACNDRhFKLEaNCeqVYP7i/VSu9d79G4ujOBQh3a7ZkUBWNHtKejCQ==
X-Received: by 2002:a05:6a00:1797:b0:651:ce88:27f5 with SMTP id s23-20020a056a00179700b00651ce8827f5mr2868665pfg.13.1685668787777;
        Thu, 01 Jun 2023 18:19:47 -0700 (PDT)
Message-ID: <79a05a62-6cd9-2769-fe3a-8f12f059183a@bytedance.com>
Date: Fri, 2 Jun 2023 09:17:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: parav@nvidia.com, mst@redhat.com, jasowang@redhat.com,
 virtio-comment@lists.oasis-open.org, houp@yusur.tech,
 helei.sig11@bytedance.com, xinhao.kong@duke.edu
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-2-pizhenwei@bytedance.com>
 <20230531140002.GC1248296@fedora>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20230531140002.GC1248296@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [virtio-comment] Re: Re: [PATCH v2 01/11] transport-fabrics: introduce Virtio Over
 Fabrics overview



On 5/31/23 22:00, Stefan Hajnoczi wrote:
> On Thu, May 04, 2023 at 04:19:00PM +0800, zhenwei pi wrote:
>> In the past years, virtio supports lots of device specifications by
>> PCI/MMIO/CCW. These devices work fine in the virtualization environment.
>>
>> Introduce Virtio Over Fabrics transport to support "network defined
>> peripheral devices". With this transport, Many Virtio based devices
>> transparently work over fabrics. Note that the balloon device may not
>> make sense. Shared memory regions won't work.
>>
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>> ---
>>   content.tex           |  1 +
>>   transport-fabrics.tex | 31 +++++++++++++++++++++++++++++++
>>   2 files changed, 32 insertions(+)
>>   create mode 100644 transport-fabrics.tex
>>
>> diff --git a/content.tex b/content.tex
>> index cff548a..f899c3a 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -582,6 +582,7 @@ \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
>>   \input{transport-pci.tex}
>>   \input{transport-mmio.tex}
>>   \input{transport-ccw.tex}
>> +\input{transport-fabrics.tex}
>>   
>>   \chapter{Device Types}\label{sec:Device Types}
>>   
>> diff --git a/transport-fabrics.tex b/transport-fabrics.tex
>> new file mode 100644
>> index 0000000..0dc031b
>> --- /dev/null
>> +++ b/transport-fabrics.tex
>> @@ -0,0 +1,31 @@
>> +\section{Virtio Over Fabrics}\label{sec:Virtio Transport Options / Virtio Over Fabrics}
>> +
>> +This section defines specification to Virtio that enables operation over other
>> +interconnects. A central goal of Virtio Over Fabrics is to maintain consistency
>> +with the PCI device, so Virtio based devices transparently work over PCI or
>> +fabrics.
> 
> The reader wants to know what VIRTIO Over Fabrics is, not how it relates
> to other Transports that they may not be very familiar with.
> 
> Fabrics is a Transport and any Transport is capable of supporting the
> VIRTIO device model. Therefore I don't think the stated aim should be to
> match PCI specifically. Just being a Transport is already enough. PCI is
> not special.
> 
> I suggest something like:
> 
>    Virtio Over Fabrics enables operation over interconnects that rely
>    primarily on message passing. Supported interconnects include TODO.
> 
>> +
>> +Virtio Over Fabrics uses reliable connection to transmit data, the reliable
> 
> "uses a reliable connection"
> 
>> +connection betweens two rules:
> 
> "connection facilitates communication between entities playing the following roles:"
> 
>> +
>> +\begin{itemize}
>> +\item An initiator functions as an Virtio Over Fabrics client. An initiator
> 
> "as a Virtio ..."
> 
>> +typically serves the same purpose to a machine as a Virtio device, issues
>> +commands to remote side.
> 
> This says that the driver talks to the initiator instead of a local
> device and the initiator forwards commands to the actual device on the
> remote side?
> 
> I find this sentence confusing because I associate the initiator with
> the driver, not the device.
> 
> Maybe:
> 
>    The initiator sends commands from the driver to the target.
> 
>> +\item A target functions as an Virtio Over Fabrics server. An target typically
> 
> "A target"
> 
>> +handles commands from the initiator side and responses completions.
> 
> The concept of the device is missing here. For symmetry it may be good
> to say something like:
> 
>    The target forwards commands to the device and sends responses back to
>    the initiator.
> 
>> +\end{itemize}
>> +
>> +Virtio Over Fabrics has the following differences from the PCI based
>> +specification:
>> +
>> +\begin{itemize}
>> +\item Instead of memory sharing mechanism of virtqueue, there is a one-to-one
>> +mapping between virtqueue and the reliable connection which executes the vring
>> +data transmission.
>> +\item An additional control connection is required to execute control commands
>> +which is similar to read/write register on a PCI device.
>> +\item Virtio Over Fabrics does not define an interrupt mechanism that allows an
>> +initiator to generate a host interrupt. It is the responsibility of the host
>> +fabric interface to generate host interrupts.
>> +\end{itemize}
> 
> As mentioned above, comparing against PCI requires that the reader is
> familiar with PCI. I think it would be preferrable to explain the unique
> characteristics of Virtio Over Fabrics in a self-contained way:
> 
>    The basic organization of Virtio Over Fabrics is as follows:
> 
>    \begin{itemize}
>    \item A reliable connection carries control commands that are not specific to a virtqueue.
>    \item Each virtqueue has its own reliable connection.
>    \item There is no interrupt mechanism since the arrival of data on the fabric already indicates when there is activity.
>    \end{itemize}
> 
> Stefan

I'll drop comparing against PCI part, and fix other parts in the next 
version. Thanks!

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

