Return-Path: <virtio-comment-return-6093-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4506BC7EE24
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 08:41:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4A9822C23
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 08:41:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2E4D59867E5
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 08:41:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1AB689867DD; Fri,  2 Jun 2023 08:41:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 070219867DE
	for <virtio-comment@lists.oasis-open.org>; Fri,  2 Jun 2023 08:41:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685695301; x=1688287301;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2H6M/O0dCKeyyyBCXJSGvQ/ufPpz+zWGUK9jKKUVUms=;
        b=Gb1Li6r3qBjjL2C49z+4xiS/FpRD9gRXbB6oEZY7g0AM1u2fZh81jBzaLkp0XjzzWh
         nWuRiKzyZZA7gU23qdaiJsWep9zOjklHZHer346+WHZFveWFhUd+OBZvj3cV9GtbT6ap
         h5sh/euAy39Zvop6LpP98yx6KdqRZK5bXYln/YtuH+N3e9162VblaEnEtgywMbPvnthH
         H+H+t1irRLqGneKqkfYA7xkeuPd1Ug5L0Hai1wFGBW7ZIPdXpj6FpZENciiBgHFgK1tk
         /NgXqSI7kDx39aKkFZFTJgP1Ea2lqjwsqJnZp4jFUiPWOHp2V54Jdo9TMSL8BEDMuLbh
         Jqyg==
X-Gm-Message-State: AC+VfDx5Gvt1SVs+Dh7jpcrTtxvP8LpfyucXiTdj66hwsHYFVAWLMBMU
	1mgr6oxju0bRAHOYRRjI7kX8gw==
X-Google-Smtp-Source: ACHHUZ4Adf4zU0MSrtX7+CZYzXPNrVf9rWHkpAagS/RzUwrXfM4TnQOEAvxNtg9VFJxGDnn0mvNvyA==
X-Received: by 2002:a05:620a:3d14:b0:75b:23a0:dea5 with SMTP id tq20-20020a05620a3d1400b0075b23a0dea5mr10622288qkn.35.1685695300795;
        Fri, 02 Jun 2023 01:41:40 -0700 (PDT)
Message-ID: <3775beed-5e2b-0835-d257-f495b16fba0f@bytedance.com>
Date: Fri, 2 Jun 2023 16:39:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: parav@nvidia.com, mst@redhat.com, jasowang@redhat.com,
 virtio-comment@lists.oasis-open.org, houp@yusur.tech,
 helei.sig11@bytedance.com, xinhao.kong@duke.edu
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-8-pizhenwei@bytedance.com>
 <20230531205508.GA1509630@fedora>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20230531205508.GA1509630@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [virtio-comment] Re: Re: [PATCH v2 07/11] transport-fabrics: introduce opcodes



On 6/1/23 04:55, Stefan Hajnoczi wrote:
> On Thu, May 04, 2023 at 04:19:06PM +0800, zhenwei pi wrote:
>> Define opcode with this rule:
>> The Virtio-oF transport layer commands use 0x0000-0x0fff, and the
>> device layer commands use 0x1000-0xffff.
>> get/set status/feature/
>> config use consecutive number.
>>
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>> ---
>>   transport-fabrics.tex | 134 ++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 134 insertions(+)
>>
>> diff --git a/transport-fabrics.tex b/transport-fabrics.tex
>> index 37f57c6..026ff5f 100644
>> --- a/transport-fabrics.tex
>> +++ b/transport-fabrics.tex
>> @@ -704,3 +704,137 @@ \subsubsection{Commands Definition}\label{sec:Virtio Transport Options / Virtio
>>   Note that Virtio Over Fabrics does not define an interrupt mechanism, generally
>>   the initiator receives a Completion, it SHOULD generate a host interrupt
>>   (if no interrupt suspending on device).
>> +
>> +\subsubsection{Opcodes Definition}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition}
>> +This section defines command opcodes for Virtio Over Fabrics:
>> +
>> +\begin{lstlisting}
>> +#define virtio_of_op_connect               0x0000
>> +#define virtio_of_op_discconnect           0x0001
> 
> "disconnect"
> 

OK.

>> +#define virtio_of_op_get_feature           0x0002
>> +#define virtio_of_op_set_feature           0x0003
>> +#define virtio_of_op_keepalive             0x0004
>> +#define virtio_of_op_vring                 0x0fff
>> +#define virtio_of_op_get_vendor_id         0x1000
>> +#define virtio_of_op_get_device_id         0x1001
>> +#define virtio_of_op_get_generation        0x1002
>> +#define virtio_of_op_get_status            0x1004
>> +#define virtio_of_op_set_status            0x1005
>> +#define virtio_of_op_get_device_feature    0x1006
>> +#define virtio_of_op_set_driver_feature    0x1007
>> +#define virtio_of_op_get_num_queues        0x1008
>> +#define virtio_of_op_get_queue_size        0x100a
>> +#define virtio_of_op_get_config            0x100c
>> +#define virtio_of_op_set_config            0x100d
>> +\end{lstlisting}
> 
> Is Queue Reset missing?
> https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.html#x1-280001
> 

Originally, I designed reset as set_status(0). But an explicit reset 
command is better! Add this in next version.

>> +
>> +\paragraph{virtio_of_op_connect}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_connect}
>> +
>> +virtio_of_op_connect is used to connect a target for both control queue and virtqueue.
>> +The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Connect Command}
>> +and specify the ndesc field as 1, also contains 1 structure virtio_of_vring_desc
>> +filled by structure virtio_of_command_status.
> 
> What are the semantics of this command? Is the idea that the initiatior
> will establish 1 TCP connection to the target for every virtqueue (plus
> one for the control queue) and send a virtio_of_op_connect command as
> the first command in the connection in order to indicate that the
> connection is associated with a specific queue?
>

Yes.

> Is there a state machine related to connection and queue lifecycles?
> 

No state machine related to connection. The lifecycles of Virtio-oF 
queues: establish a connection(transport specific), issue connect 
command, issue control/vq command ... issue disconnect command(optional, 
gracefully shutdown), disconnection connection.

>> +
>> +\paragraph{virtio_of_op_discconnect}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_discconnect}
>> +
>> +virtio_of_op_discconnect is used to disconnect a target for both control queue and virtqueue.
>> +The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Common Command}.
> 
> What happens if the initiatior drops the connection without sending a
> virtio_of_op_discconnect command?
> 

A Virtio-of queue could shutdown gracefully by issuing 
virtio_of_op_discconnect command. The inflight commands will be 
completed by target.
Otherwise the inflight commands may be dropped by target.

> Are there resources associated with a connected queue?
> 

A control queue disconnects, the initiator and target should shutdown 
all the virtqueues associated with this control queue.

A connected virtqueue associates a QID for both initiator and target 
side, once a Virtio-of queue disconnects, the QID becomes free, allow 
reconnect.

>> +
>> +\paragraph{virtio_of_op_get_feature}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_feature}
>> +
>> +virtio_of_op_get_feature is used to get features of target for control queue only.
> 
> Does this command fail when sent to a virtqueue instead of the control
> queue?
> 
> By the way, what's the difference between a connection and queue?
> 

I need describe the mapping between a connection and queue in '[PATCH v2 
01/11] transport-fabrics: introduce Virtio Over Fabrics overview', and 
use 'Virtio Over Fabrics queue' only.

>> +The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Feature Command}.
> 
> When? As the first message or immediately after virtio_of_op_connect?
> 

At any time theory. As the first message or immediately after 
virtio_of_op_connect is recommended.

>> +
>> +\begin{tabular}{ |l|l|l| }
>> +\hline
>> +Feature Select & Value & Description \\
>> +\hline
>> +virtio_of_feature_max_segment & 0x0 & Get the maximum segments within a Vring Command supported by target \\
> 
> Does Vring Command mean virtio_of_op_vring? What is the difference
> between "segments" and "descriptors"?
> 
> Does the max_segment value have a type or does the initiator have to
> support up to u64?
> 
> How does max_segment affect the maximum number of virtqueue buffer
> elements?
> 
> What happens when a feature that is not supported by the target is
> queried by the initiator?
> 
> I was expecting a feature bit negotiation mechanism, but it seems the
> "feature" is a parameter value, not just a single but like VIRTIO
> Feature Bits. Please rename this to "parameter", "setting", or similar
> to avoid confusion with Feature Bits.
> 

VIRTIO Feature Bits style is fine. Change into this style in next 
version. Then I'd introduce a new opcode 
virtio_of_op_get_max_segment(required command, no feature bits testing).

>> +\hline
>> +\end{tabular}
>> +
>> +\paragraph{virtio_of_op_set_feature}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_set_feature}
>> +
>> +virtio_of_op_set_feature is used to set features of initiator for control queue only.
> 
> "set features of initiator" sounds like the target uses it to set up the
> initiator, but I think this command is sent from the initiator to the
> target. Maybe:
> 
>    "virtio_of_op_set_feature sets feature values in the target and is
>    sent on the control queue."
> 

OK.

>> +The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Feature Command}.
> 
> There are currently no features defined that can be set using
> virtio_of_op_set_feature?
> 

'[PATCH v2 11/11] transport-fabrics: support inline data for keyed 
transmission' would be the first bit.

>> +\paragraph{virtio_of_op_keepalive}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_keepalive}
>> +
>> +virtio_of_op_keepalive is used to keep alive with the target for control queue only.
>> +The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Common Command}.
> 
> What is the purpose of this command? It is only sent on the control
> queue so its purpose cannot be to actually keep connections alive since
> virtqueue connections would not stay alive.
> 
> Maybe this is really a health check (ping/pong) to detect when the
> control queue becomes unavailable?
> 

Originally I thought that keepalive for control is enough: once the 
control becomes unavailable, shutdown the control queue and all the 
related virtqueues. the virtio_of_op_vring commands detect the virtqueue 
connection implicitly.

This command for both control queue and virtqueue is fine.

>> +\paragraph{}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_vring}
>> +
>> +virtio_of_op_vring is used to transmit buffer for both control queue and virtqueue.
> 
> "buffers"
> 
> My understanding is that the control queue is not a virtqueue. How can a
> vring operation make sense on something that is not a virtqueue?
> 

Oh, my fault. this is for virtqueue only. and virtio_of_op_vring should 
be renamed to virtio_of_op_vq.

> I think the term used by the VIRTIO spec (2.6 Virtqueues) is "supply an
> available buffer to the device" rather than "transmit buffer".
> 

OK.

>> +The initiator MUST issues \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Vring Command}
> 
> "issue"
> 
>> +and specify the ndesc field as the number of buffer segments,
> 
> buffer segments == data segments == segment descriptor (struct virtio_of_vring_desc)?
> 
> Please pick one term and use it consistently.
> 

OK.

>> +also contains ndesc structure virtio_of_vring_desc.
>> +Each structure virtio_of_vring_desc is filled by each buffer segment one by one.
>> +
>> +\paragraph{virtio_of_op_get_vendor_id}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_vendor_id}
>> +
>> +virtio_of_op_get_vendor_id is used to get vendor id for control queue only.
> 
> The spec uses slightly more specific terms that avoid confusion with
> other types of device/vendor IDs: either "get the Virtio Vendor ID" or
> "get the Virtio Subsystem Vendor ID".
> 

OK.

>> +The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Common Command},
>> +and reads from value field of Completion as le32.
>> +
>> +\paragraph{virtio_of_op_get_device_id}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_device_id}
>> +
>> +virtio_of_op_get_device_id is used to get device id for control queue only.
> 
> "get the Virtio Device ID" or "get the Virtio Subsystem Device ID"
> 

OK.

>> +The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Common Command},
>> +and reads from value field of Completion as le32.
>> +
>> +\paragraph{virtio_of_op_get_generation}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_generation}
>> +
>> +virtio_of_op_get_generation is used to get config generation for control queue only.
>> +The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Common Command},
>> +and reads from value field of Completion as le32.
> 
> Maybe every virtio_of_op_get_config completion should include the
> generation counter value. That way fewer roundtrips are required because
> virtio_of_op_get_generation commands are not necessary.
> 
> The advantage to virtio_of_op_get_generation is that it maps nicely to
> existing VIRTIO driver frameworks that expect to read the generation
> counter separately, so I guess it's okay to keep it even if it's
> inefficient over a fabric.
> 
> We could do both, too.
> 

Great! I'd define a new structure for 
virtio_of_op_get_generation(include generation field) and drop 
virtio_of_op_get_generation.

>> +
>> +\paragraph{virtio_of_op_get_status}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_status}
>> +
>> +virtio_of_op_get_status is used to get device status for control queue only.
>> +The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Common Command},
>> +and reads from value field of Completion as le32.
>> +
>> +\paragraph{virtio_of_op_set_status}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_set_status}
>> +
>> +virtio_of_op_set_status is used to set device status for control queue only.
>> +The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Common Command},
>> +and specify the value field of Common Command as le32.
>> +
>> +\paragraph{virtio_of_op_get_device_feature}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_device_feature}
>> +
>> +virtio_of_op_get_device_feature is used to get device feature for control queue only.
>> +The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Feature Command},
>> +and reads from value field of Completion as le64.
> 
> What happens when feature_select is out of range? I guess
> Completion.value is set to 0.
> 

Yes. But I think the feature_select is always in range, bit64-bit 
127(feature_select == 1) is not offered currently, so 
Completion.value.u64 is 0.

> Does virtio_of_op_get_device_feature return the feature bits offered by
> the device or does it update to reflect negotiated feature bits after
> virtio_of_op_set_driver_feature?
> 

virtio_of_op_get_device_feature returns the same feature bits after 
virtio_of_op_set_driver_feature. Because 1) the device feature is 
capability of device, 2) a target may be shared by multi initiators.

For now, I don't see any dependence on getting driver feature. Do you 
have any concern about this?

>> +
>> +\paragraph{virtio_of_op_set_driver_feature}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_set_driver_feature}
>> +
>> +virtio_of_op_set_driver_feature is used to set driver feature for control queue only.
>> +The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Feature Command},
>> +and specify the value field of Common Command as le64.
>> +
>> +The initiator uses feature_select field to select which feature bits to set.
>> +Value 0x0 selects Feature Bits 0 to 63, 0x1 selects Feature Bits 64 to 128, etc.
>> +
>> +\paragraph{virtio_of_op_get_num_queues}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_num_queues}
>> +
>> +virtio_of_op_get_num_queues is used to get the number of queues for control queue only.
>> +The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Common Command},
>> +and reads from value field of Completion as le16.
>> +
>> +\paragraph{virtio_of_op_get_queue_size}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_queue_size}
>> +
>> +virtio_of_op_get_queue_size is used to get the size of a specified queue for control queue only.
>> +The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Queue Command} with specified queue_id,
>> +and reads from value field of Completion as le16.
> 
> Is it possible to set the queue size? For example, the PCI Transport
> allows the driver to lower the queue size but not increase it (see
> 4.1.5.1.3 Virtqueue Configuration).
> 

Agree. Because a target may be shared by multi initiators, it's not 
reasonable to set queue size of target, the queue size only affect this 
initiator itself.
For example, a target supports queue size 1024. initiatorX uses 128 
queue size, and initiatorY uses 1024. Do you have any suggestion about this?

>> +
>> +\paragraph{virtio_of_op_get_config}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_get_config}
>> +
>> +virtio_of_op_get_config is used to get the config of a device for control queue only.
>> +The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Config Command} with specified offset and bytes,
>> +and reads from value field of Completion.
>> +
>> +\paragraph{virtio_of_op_set_config}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Opcodes Definition / virtio_of_op_set_config}
>> +
>> +virtio_of_op_set_config is used to set the config of a device for control queue only.
>> +The initiator MUST issue a \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Config Command} with specified offset and bytes and value fields.
>> -- 
>> 2.25.1
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

