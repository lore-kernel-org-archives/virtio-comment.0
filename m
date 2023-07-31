Return-Path: <virtio-comment-return-6922-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB52EB64DD
	for <virtio-comment@archiver.kernel.org>; Mon, 31 Jul 2023 02:36:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0FE8A61267
	for <virtio-comment@archiver.kernel.org>; Mon, 31 Jul 2023 02:36:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 02BCD986385
	for <virtio-comment@archiver.kernel.org>; Mon, 31 Jul 2023 02:36:24 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EC85D983EB2; Mon, 31 Jul 2023 02:36:23 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DBA51986364
	for <virtio-comment@lists.oasis-open.org>; Mon, 31 Jul 2023 02:36:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690770982; x=1691375782;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z70f8ugQaxEde1XKKx9D1WkcxmW9D7pHjgjPaVvFwi0=;
        b=Dp3DYcs8io1akHahI1krF2TU4SIMggRulKZ7mXTB3A4yJrmJ1ftc4ATGYuafmZ145L
         OHn+L30CGFNSwmWRnkxrR3yEghln04WH/gkyrmDHvgEr80QeAONV9vemes7lxzwx15pw
         BNJudprhNXaiOI7d+qqq7i8tUy5D+UvcwJIqS6j4q+EjbibNrqGM9wg2Xr1/jdPiSpJ8
         UVt5JhAcbniPopa7nt6suz2VDyvtUjL6CHoAMkP9zM90Y4m5vOF+9b3G+V2tVwMdq7V3
         F5A2pdMdH/Cem4Cg2mHTc6d5BZ7BGH0nsNEB9zY4Z0HhWILouutDGBGglFEP0xcIr+G6
         2GjA==
X-Gm-Message-State: ABy/qLasNQsQ4GXyZuzsZqsN7udRvb8RMvjwJ//uia8Z4ayiz26ctmLY
	N4qumKhNQuP/Y2jyMNUPlTFjEeJ7D/uwL/bAJKE=
X-Google-Smtp-Source: APBJJlEqV7tO1A0bxtXGVR+NjPgc5vROMXbrIkcVM2e+k4qsS0uxNU1iV63NY7e5vQfRKFPOCw9twg==
X-Received: by 2002:a17:902:ea05:b0:1b9:f9a1:85f1 with SMTP id s5-20020a170902ea0500b001b9f9a185f1mr9914978plg.19.1690770982008;
        Sun, 30 Jul 2023 19:36:22 -0700 (PDT)
Message-ID: <191efc28-1a4a-2ba6-a27e-9904510e2b09@bytedance.com>
Date: Mon, 31 Jul 2023 10:36:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, "parav@nvidia.com"
 <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "houp@yusur.tech" <houp@yusur.tech>,
 "zhouhuaping.san@bytedance.com" <zhouhuaping.san@bytedance.com>,
 "xinhao.kong@duke.edu" <xinhao.kong@duke.edu>
References: <20230626072551.1709389-1-pizhenwei@bytedance.com>
 <20230626072551.1709389-6-pizhenwei@bytedance.com>
 <14BFE93D-0888-42E4-AF6C-389008E83E0A@nutanix.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <14BFE93D-0888-42E4-AF6C-389008E83E0A@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: Re: [virtio-comment] [PATCH v4 5/7] transport-fabrics: introduce
 transport binding



On 7/30/23 07:28, Raphael Norwitz wrote:
> 
> 
>> On Jun 26, 2023, at 3:25 AM, zhenwei pi <pizhenwei@bytedance.com> wrote:
>>
>> Add TCP/IP, TLS TCP/IP, RDMA transports.
>>
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>> ---
>> transport-fabrics.tex | 26 ++++++++++++++++++++++++++
>> 1 file changed, 26 insertions(+)
>>
>> diff --git a/transport-fabrics.tex b/transport-fabrics.tex
>> index 3fd9e8e..75e4855 100644
>> --- a/transport-fabrics.tex
>> +++ b/transport-fabrics.tex
>> @@ -729,3 +729,29 @@ \subsubsection{Opcodes}\label{sec:Virtio Transport Options / Virtio Over Fabrics
>> \paragraph{Keepalive Completion}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Commands Definition / Opcodes / Keepalive Completion}
>> A Keepalive Completion is used as a health check mechanism to detect when a Virtio-oF initiator becomes unavailable, it is used by a Virtio-oF device instance for the Virtio-oF control queue only.
>> Once the Virtio-oF initiator becomes unavailable, the Virtio-oF target should destroy the Virtio-oF device instance and associated resources.
>> +
>> +
>> +\subsection{Transport Binding}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transport Binding}
>> +
>> +\subsubsection{TCP/IP}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transport Binding / TCP IP}
>> +Virtio-oF supports both TCP/IPv4 and TCP/IPv6, it uses
>> +\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Protocol Data Unit/ Stream Data Transfers}.
>> +A TCP/IP based Virtio-oF target uses port 8549 (CRC-16/ARC of "Virtio") by default.
>> +
>> +\subsubsection{TLS TCP/IP}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transport Binding / TLS TCP IP}
>> +Virtio-oF supports both TLS v1.2 and TLS v1.3 over the underlying TCP/IPv4 and TCP/IPv6, it uses
>> +\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Protocol Data Unit/ Stream Data Transfers}.
>> +A TLS TCP/IP based Virtio-oF target uses port 8549 (CRC-16/ARC of "Virtio") by default.
>> +
>> +\subsubsection{RDMA}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transport Binding / RDMA}
>> +Virtio-oF supports RDMA, it uses
>> +\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Protocol Data Unit/ Keyed Data Transfers}.
>> +A RoCEv2 based Virtio-oF target uses UDP port 8549 (CRC-16/ARC of "Virtio") by default, and a iWARP based Virtio-oF target uses TCP port 8549 by default.
>> +
>> +RDMA uses the following operations:
>> +\begin{itemize}
>> +\item The Virtio-oF initiator sends a PDU by RDMA SEND.
> 
> What about with “eager buffers”? It probably uses RDMA write for those?
> 

Yes, the target side exposes a MR, the initiator side use RDMA WRITE to 
access it.

>> +\item The Virtio-oF target reads the remote data by RDMA SEND.
> 
> I assume you meant the target reads with RDMA read?
> 

Thanks, I'll fix this.

>> +\item The Virtio-oF target writes the remote data by RDMA WRITE.
>> +\item The Virtio-oF target sends a PDU by RDMA SEND.
>> +\end{itemize}
>> -- 
>> 2.25.1
>>
>>
>> This publicly archived list offers a means to provide input to the
>> OASIS Virtual I/O Device (VIRTIO) TC.
>>
>> In order to verify user consent to the Feedback License terms and
>> to minimize spam in the list archive, subscription is required
>> before posting.
>>
>> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
>> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
>> List help: virtio-comment-help@lists.oasis-open.org
>> List archive: https://lists.oasis-open.org/archives/virtio-comment/
>> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
>> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
>> Committee: https://www.oasis-open.org/committees/virtio/
>> Join OASIS: https://www.oasis-open.org/join/
>>
>>
> 

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

