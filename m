Return-Path: <virtio-comment-return-6094-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35864C7EE29
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 09:09:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 574C060342
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 09:09:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3EF619867E0
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 09:09:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 299F29867DD; Fri,  2 Jun 2023 09:09:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1580E9867DE
	for <virtio-comment@lists.oasis-open.org>; Fri,  2 Jun 2023 09:09:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685696965; x=1688288965;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bR2rqfQNvT0dJka+GFEcXovVTl1dDxKPoIhjTsTdWMk=;
        b=N/yjQ3tWWS4cTAHx98k5vQii3dBB2hQMPYqzT11Fzj+DoxaTRmyYSXaPkbNH1wMcVQ
         AP8cE0fyKE2Tz/aYaUSnsA6yvcCBIPQPI/omyDSwM0G0BrrQCsL85itrh8ysfoq0kmnN
         UaZ+452ud169HLLmm4pRuoqXsofbUwtu2lY+cLXQ8rfMHVo1N77XGCZizowAdxN50HyA
         VBcXQYeUck9xdONnrvRu0cmiAXtNYY2pnMA0m5tGkRfsE33jqmKdjaEGX3KTzmEH3pcS
         igNx3GaEc4rBra4IENl3xA58oo1L1q8uXfXLPFC+w7jGLU7X9pL9yLkZykrRza/Qp55d
         OvZw==
X-Gm-Message-State: AC+VfDykl0TpsY18NDaIOHsq6LNlIlY2sx/r1b4h/myiS8m9B7VYaU4h
	z00ERf+xZ7ivaY2vATmalGWA8w==
X-Google-Smtp-Source: ACHHUZ6Dq893IKCMTRJCHhz17lEE7cih83xHMMxLu9eVXP1Jirinc8ClYsqwdHAX3KLy8yhLQw+T0w==
X-Received: by 2002:a17:902:c94a:b0:1ad:1c22:1b53 with SMTP id i10-20020a170902c94a00b001ad1c221b53mr2290253pla.40.1685696965454;
        Fri, 02 Jun 2023 02:09:25 -0700 (PDT)
Message-ID: <8c964d51-5868-2dc9-6bf0-d0f58a2eced1@bytedance.com>
Date: Fri, 2 Jun 2023 17:07:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: parav@nvidia.com, mst@redhat.com, jasowang@redhat.com,
 virtio-comment@lists.oasis-open.org, houp@yusur.tech,
 helei.sig11@bytedance.com, xinhao.kong@duke.edu
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-10-pizhenwei@bytedance.com>
 <20230531210255.GC1509630@fedora>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20230531210255.GC1509630@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [virtio-comment] Re: Re: [PATCH v2 09/11] transport-fabrics: add TCP&RDMA binding



On 6/1/23 05:02, Stefan Hajnoczi wrote:
> On Thu, May 04, 2023 at 04:19:08PM +0800, zhenwei pi wrote:
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>> ---
>>   transport-fabrics.tex | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/transport-fabrics.tex b/transport-fabrics.tex
>> index f563c3e..c47a744 100644
>> --- a/transport-fabrics.tex
>> +++ b/transport-fabrics.tex
>> @@ -873,3 +873,12 @@ \subsubsection{Status Definition}\label{sec:Virtio Transport Options / Virtio Ov
>>   #define VIRTIO_OF_EALREADY      114
>>   #define VIRTIO_OF_EQUIRK        4096
>>   \end{lstlisting}
>> +
>> +\subsection{Transport Binding}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transport Binding}
>> +\subsubsection{TCP}\label{sec:Virtio Transport Options / Virtio Over Fabrics / ransport Binding / TCP}
>> +TCP MUST use \ref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Stream Transmission}
>> +~\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Stream Transmission}.
>> +
>> +\subsubsection{RDMA}\label{sec:Virtio Transport Options / Virtio Over Fabrics / ransport Binding / RDMA}
>> +RDMA MUST use \ref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Keyed Transmission}
>> +~\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Keyed Transmission}.
> 
> What about VQN representation, default port numbers, etc? There should
> be enough information here so implementers can create compatible
> implementations.
> 

Already replied in '[PATCH v2 02/11] transport-fabrics: introduce Virtio 
Qualified Name'.

> Is there connection encryption support? It's hard to imagine running a
> plaintext Virtio Over Fabrics TCP connection in a production environment
> due to security concerns.
> 
> Stefan

As far as I can see, 1) an ACL mechanism could be used in the 
engineering implementation without any specification.(ex, a target only 
allows a specific IVQN). 2) authentication may be introduced in the future.

Does the virtqueue buffers need encryption support?

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

