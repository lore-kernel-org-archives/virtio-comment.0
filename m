Return-Path: <virtio-comment-return-6194-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA47C7EE29
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 02:17:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E0A9C7A1C8
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 02:17:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CBE2698658B
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 02:17:19 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B6352986585; Wed,  7 Jun 2023 02:17:19 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A3F15986586
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Jun 2023 02:17:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686104238; x=1688696238;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FOASWdbRq9uRkgI1ajaS6w8fknEKoEHB5QZW5Cpvl44=;
        b=UYUgLddRgX87mMxU4ilDdLiw8k3bIYlx9bPwp3i2XafZ+JR2selkKw8SGJmi01bfWp
         gMucPX/l1vnlKO5RiG5U/ed1J/EZ1yHu41eWyRH54wmT/HMjJITVRhdgcCrMSb/0vWxi
         6t0wcGFC5NbLSe8GVKo8BL67QWUJ+MlgQdZVTExZiGSXhNJfLB2vhq1MY7QQQW5SBKXH
         ZZqfGFkchj9gm3RwpvfPV2dmiN7uiKEiasmPBDw8q5GccrvOYHnXjSF/5YxhUOlb/WWS
         TXs7KZ4SJrth7pV6LHYPdwYkp7WpnhmDenJWzq/poVKnHjgK+dOyBzm3hUipH75PmiuU
         AMhA==
X-Gm-Message-State: AC+VfDz2PseF4I3lCelpl4ic8vJBV65vPyzxw9aedWJOE5Fqy5DB+naH
	bE+5SwnLc0L39O0L+KiiHapjeQ==
X-Google-Smtp-Source: ACHHUZ5d5A2FZwOISm64cdC5OvnNoOlMobnkGWxQzS6icQ0DlSLXTDp/3l5g0ITw52VTHPCUOJoSWw==
X-Received: by 2002:a9d:7590:0:b0:6b1:7492:dc31 with SMTP id s16-20020a9d7590000000b006b17492dc31mr4345042otk.22.1686104238092;
        Tue, 06 Jun 2023 19:17:18 -0700 (PDT)
Message-ID: <3b0b212f-532e-47de-69a3-1a8a2f0b3317@bytedance.com>
Date: Wed, 7 Jun 2023 10:15:04 +0800
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
 <795e4787-867d-915a-7385-206a5ba37631@bytedance.com>
 <20230606135156.GE1958291@fedora>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20230606135156.GE1958291@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Re: [virtio-comment] Re: Re: Re: [PATCH v2 09/11]
 transport-fabrics: add TCP&RDMA binding

On 6/6/23 21:51, Stefan Hajnoczi wrote:
> On Tue, Jun 06, 2023 at 09:41:09AM +0800, zhenwei pi wrote:
>> On 6/6/23 00:57, Stefan Hajnoczi wrote:
>>> On Fri, Jun 02, 2023 at 05:07:14PM +0800, zhenwei pi wrote:
>>>>
>>>>
>>>> On 6/1/23 05:02, Stefan Hajnoczi wrote:
>>>>> On Thu, May 04, 2023 at 04:19:08PM +0800, zhenwei pi wrote:
>>>>>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>>>>>> ---
>>>>>>     transport-fabrics.tex | 9 +++++++++
>>>>>>     1 file changed, 9 insertions(+)
>>>>>>
>>>>>> diff --git a/transport-fabrics.tex b/transport-fabrics.tex
>>>>>> index f563c3e..c47a744 100644
>>>>>> --- a/transport-fabrics.tex
>>>>>> +++ b/transport-fabrics.tex
>>>>>> @@ -873,3 +873,12 @@ \subsubsection{Status Definition}\label{sec:Virtio Transport Options / Virtio Ov
>>>>>>     #define VIRTIO_OF_EALREADY      114
>>>>>>     #define VIRTIO_OF_EQUIRK        4096
>>>>>>     \end{lstlisting}
>>>>>> +
>>>>>> +\subsection{Transport Binding}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transport Binding}
>>>>>> +\subsubsection{TCP}\label{sec:Virtio Transport Options / Virtio Over Fabrics / ransport Binding / TCP}
>>>>>> +TCP MUST use \ref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Stream Transmission}
>>>>>> +~\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Stream Transmission}.
>>>>>> +
>>>>>> +\subsubsection{RDMA}\label{sec:Virtio Transport Options / Virtio Over Fabrics / ransport Binding / RDMA}
>>>>>> +RDMA MUST use \ref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Keyed Transmission}
>>>>>> +~\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Keyed Transmission}.
>>>>>
>>>>> What about VQN representation, default port numbers, etc? There should
>>>>> be enough information here so implementers can create compatible
>>>>> implementations.
>>>>>
>>>>
>>>> Already replied in '[PATCH v2 02/11] transport-fabrics: introduce Virtio
>>>> Qualified Name'.
>>>>
>>>>> Is there connection encryption support? It's hard to imagine running a
>>>>> plaintext Virtio Over Fabrics TCP connection in a production environment
>>>>> due to security concerns.
>>>>>
>>>>> Stefan
>>>>
>>>> As far as I can see, 1) an ACL mechanism could be used in the engineering
>>>> implementation without any specification.(ex, a target only allows a
>>>> specific IVQN). 2) authentication may be introduced in the future.
>>>>
>>>> Does the virtqueue buffers need encryption support?
>>>
>>> An ACL in the target is still susceptible to attacks on confidentiality
>>> (spying on traffic) and integrity (spoofing, injecting, or corrupting
>>> traffic).
>>>
>>> My view is that nowadays anything that goes over the network needs
>>> Transport Layer Security (TLS) built in or something comparable unless
>>> the use cases are clearly limited to scenarios where this is not
>>> necessary. To me it seems like Virtio over Fabarics could be used in
>>> scenarios where encryption is necessary (e.g. to protect user data being
>>> sent over a network).
>>>
>>> NVMe-over-TCP supports TLS.
>>>
>>> Stefan
>>
>> Generally, LAN is considered to be secure, using TCP makes sense. TLS is
>> needed for WAN.
> 
> This depends on the security policy of the organization. I don't know
> what percentage of organizations trust internal networks, but I'm sure
> there is a significant proportion of organizations nowadays where
> deploying an unsecured network service is not allowed.
> 
> Also, Virtio Over Fabrics (TCP) will work over the internet and some
> users may use it for that.
> 
> I think including optional TLS support from the beginning is necessary.
> 
> Stefan

Agree with the optional TLS support. Let's continue the detail 
discussion in '[PATCH v2 06/11] transport-fabrics: introduce command set'.

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

