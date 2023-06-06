Return-Path: <virtio-comment-return-6147-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C59C77B73
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 01:43:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D98A529FC7
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 01:43:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BE150986494
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 01:43:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A877298590A; Tue,  6 Jun 2023 01:43:28 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 90F8D986488
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 01:43:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686015807; x=1688607807;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gjq6jMrNpgRgNDGM6KxAwPhvrChFXLJcK6Mw7pBc1hY=;
        b=eUNXU8Mkhy7TyZBHFh/SLx6bZ6pzcnk1gxEWw3xUNV8iFya9TW4NCw5J5sfM8jA3ms
         vS0n7t+hQxV69zE4cikECf7X0eLxsqCywTQnlyfvkE+VGoKuFPTaOlWZ0qmhM23WhbJd
         HQiTz843QTL5RAPqASmUdoXUCu0Y7U7xc9ShBZAHrwrhvshgU2a9e3e0Z3p2639jDqW+
         J+bNzMVXKjmaaL6ESyuEUUb+4T6h+AjrZGmS5ZXctvY7N1d3ehT0hHMAtbuCdZNdzG0s
         afu8P8bETPqjPF8IaWLQDLytS4ccwM733tGri3mcYLWQ33DW7lkCOUCNuoWwQooAWYXc
         YWFw==
X-Gm-Message-State: AC+VfDw1zAMZP3ZBix7+DwDxqyFOXvLwrDIuAe4yr03Au8IJD+GZt4hG
	cDRzgQ0g9Ole8R7OcW6SCRXqjQ==
X-Google-Smtp-Source: ACHHUZ6h6+UPBXHDDI+R9c1aPYekvaNJnURkkHycviUGS9JQJqPqnuFJEdwyvOagVTVj73TqLCTwvQ==
X-Received: by 2002:a17:903:1cf:b0:1b0:3742:e725 with SMTP id e15-20020a17090301cf00b001b03742e725mr709287plh.56.1686015806720;
        Mon, 05 Jun 2023 18:43:26 -0700 (PDT)
Message-ID: <795e4787-867d-915a-7385-206a5ba37631@bytedance.com>
Date: Tue, 6 Jun 2023 09:41:09 +0800
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
 <8c964d51-5868-2dc9-6bf0-d0f58a2eced1@bytedance.com>
 <20230605165718.GD1624556@fedora>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20230605165718.GD1624556@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [virtio-comment] Re: Re: Re: [PATCH v2 09/11] transport-fabrics: add TCP&RDMA binding

On 6/6/23 00:57, Stefan Hajnoczi wrote:
> On Fri, Jun 02, 2023 at 05:07:14PM +0800, zhenwei pi wrote:
>>
>>
>> On 6/1/23 05:02, Stefan Hajnoczi wrote:
>>> On Thu, May 04, 2023 at 04:19:08PM +0800, zhenwei pi wrote:
>>>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>>>> ---
>>>>    transport-fabrics.tex | 9 +++++++++
>>>>    1 file changed, 9 insertions(+)
>>>>
>>>> diff --git a/transport-fabrics.tex b/transport-fabrics.tex
>>>> index f563c3e..c47a744 100644
>>>> --- a/transport-fabrics.tex
>>>> +++ b/transport-fabrics.tex
>>>> @@ -873,3 +873,12 @@ \subsubsection{Status Definition}\label{sec:Virtio Transport Options / Virtio Ov
>>>>    #define VIRTIO_OF_EALREADY      114
>>>>    #define VIRTIO_OF_EQUIRK        4096
>>>>    \end{lstlisting}
>>>> +
>>>> +\subsection{Transport Binding}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transport Binding}
>>>> +\subsubsection{TCP}\label{sec:Virtio Transport Options / Virtio Over Fabrics / ransport Binding / TCP}
>>>> +TCP MUST use \ref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Stream Transmission}
>>>> +~\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Stream Transmission}.
>>>> +
>>>> +\subsubsection{RDMA}\label{sec:Virtio Transport Options / Virtio Over Fabrics / ransport Binding / RDMA}
>>>> +RDMA MUST use \ref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Keyed Transmission}
>>>> +~\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Keyed Transmission}.
>>>
>>> What about VQN representation, default port numbers, etc? There should
>>> be enough information here so implementers can create compatible
>>> implementations.
>>>
>>
>> Already replied in '[PATCH v2 02/11] transport-fabrics: introduce Virtio
>> Qualified Name'.
>>
>>> Is there connection encryption support? It's hard to imagine running a
>>> plaintext Virtio Over Fabrics TCP connection in a production environment
>>> due to security concerns.
>>>
>>> Stefan
>>
>> As far as I can see, 1) an ACL mechanism could be used in the engineering
>> implementation without any specification.(ex, a target only allows a
>> specific IVQN). 2) authentication may be introduced in the future.
>>
>> Does the virtqueue buffers need encryption support?
> 
> An ACL in the target is still susceptible to attacks on confidentiality
> (spying on traffic) and integrity (spoofing, injecting, or corrupting
> traffic).
> 
> My view is that nowadays anything that goes over the network needs
> Transport Layer Security (TLS) built in or something comparable unless
> the use cases are clearly limited to scenarios where this is not
> necessary. To me it seems like Virtio over Fabarics could be used in
> scenarios where encryption is necessary (e.g. to protect user data being
> sent over a network).
> 
> NVMe-over-TCP supports TLS.
> 
> Stefan

Generally, LAN is considered to be secure, using TCP makes sense. TLS is 
needed for WAN.

I prefer to support 2 different transports NVMe-over-TCP and 
NVMe-over-TLS, both use STREAM.

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

