Return-Path: <virtio-comment-return-6095-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3090C7EE2E
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 09:13:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 37D202AF8A
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 09:13:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2CC8F9867E1
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 09:13:18 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1E4B49867DD; Fri,  2 Jun 2023 09:13:18 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0A6009867DE
	for <virtio-comment@lists.oasis-open.org>; Fri,  2 Jun 2023 09:13:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685697194; x=1688289194;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6WIOoEVIAIHHfGVQA/EONAmxwIUlFkdQLRmlmHIPjWY=;
        b=epg9SooIDXC+4//519j6uvFrRD0i5LLlevPukTnCMd0nc3NEiTvs3OKiUVq/c74qy2
         4A55f3yQqSTq7ofXDfSfrdq/1Hd8h/tqtN2xqj0PuQbRf5tXgFrd0AJ85T1qPo0Fvg0c
         2H2TlJnma8eD/v+iVkmunMhOQRIh5Dv/FQa0kfg90AgndYZqay1GGV8ZLL2Rk3CQS+sY
         Tqr3p+RAwII5RL+Ft0o8jdQaIOh1WVQugNvC/LqcVECi0q0e5CQRv0/M6xUQWUbgeZCo
         TCSlje2r2WVY5R3KJce+mneT4Bka9e4Kq96RoQmvh0tPYPOZQBw47ROb45AyTXzZ5eRt
         /kuA==
X-Gm-Message-State: AC+VfDxxeOCdBSO/TxBXz7NNe0/eQEzifLQQR+CMkxeK26Q5cvfIvwJi
	5LJVuyiJlw1OmEFeZzVIZLuEZg==
X-Google-Smtp-Source: ACHHUZ7sIuWiweYw7uzrwAZI2uvMnDWgTjsVAWvWkhaINF9Zhk3w5AGt1xojqOlQ6eExv/jmAIuLGw==
X-Received: by 2002:a17:90a:9bc9:b0:256:bc2:6ec0 with SMTP id b9-20020a17090a9bc900b002560bc26ec0mr1166113pjw.5.1685697194042;
        Fri, 02 Jun 2023 02:13:14 -0700 (PDT)
Message-ID: <8e897b1e-a019-3602-17fa-28af5ec82d7f@bytedance.com>
Date: Fri, 2 Jun 2023 17:11:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: parav@nvidia.com, mst@redhat.com, jasowang@redhat.com,
 virtio-comment@lists.oasis-open.org, houp@yusur.tech,
 helei.sig11@bytedance.com, xinhao.kong@duke.edu
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-11-pizhenwei@bytedance.com>
 <20230531210925.GD1509630@fedora>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20230531210925.GD1509630@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Re: [virtio-comment] [PATCH v2 10/11] transport-fabrics: add
 device initialization



On 6/1/23 05:09, Stefan Hajnoczi wrote:
> On Thu, May 04, 2023 at 04:19:09PM +0800, zhenwei pi wrote:
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>> ---
>>   transport-fabrics.tex | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/transport-fabrics.tex b/transport-fabrics.tex
>> index c47a744..af35622 100644
>> --- a/transport-fabrics.tex
>> +++ b/transport-fabrics.tex
>> @@ -882,3 +882,27 @@ \subsubsection{TCP}\label{sec:Virtio Transport Options / Virtio Over Fabrics / r
>>   \subsubsection{RDMA}\label{sec:Virtio Transport Options / Virtio Over Fabrics / ransport Binding / RDMA}
>>   RDMA MUST use \ref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Keyed Transmission}
>>   ~\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Keyed Transmission}.
>> +
>> +\subsection{Device Initialization}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Device Initialization}
>> +\begin{enumerate}
>> +\item The control queue MUST be established firstly, once the reliable
> 
> It's not 100% clear whether the control queue must be established first
> and then the other things happen, or whether the other things have to
> happen in order to establish the control queue.
> 
> Here is one way to reword it:
> 
> "The control queue MUST be established first by connecting from the
> initiator to the target and sending a \nameref{sec:Virtio Transport
> Options / Virtio Over Fabrics / Transmission Protocol / Opcodes
> Definition / virtio_of_op_connect} command to create the association
> with the target."
> 
>> +connection is ready, the initiator MUST issue
>> +\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_connect}
>> +to create association with the target.
>> +\item The initiator SHOULD issue
>> +\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_feature}
>> +to discover the capabilities offered by the target.
>> +\item The initiator SHOULD issue
>> +\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_set_feature}
>> +to negotiate the capabilities.
>> +\item The initiator SHOULD continue initialization like PCI base devices, i.e. issue
> 
> Please use a \nameref to reference to something specific in the spec. It
> would be even better to list the exact steps here instead of referring
> to the PCI Transport.
> 
>> +\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_vendor_id}
>> +to get the vendor ID.
>> +\item After discovering the number of virtqueues by
>> +\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_num_queues},
>> +the initiator SHOULD create virtqueue one by one by
> 
> "virtqueues one by one with"
> 
>> +\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_connect}.
>> +\item The virtqueue SHOULD issue
> 
> "The initiator SHOULD issue"
> 
>> +\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_vring}
>> +to transmit buffer.
> 
> "to supply available buffers to the device"
> 

OK, will fix above flaws.

>> +\end{enumerate}
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

