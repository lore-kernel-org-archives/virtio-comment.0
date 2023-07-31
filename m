Return-Path: <virtio-comment-return-6924-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA75EB64DD
	for <virtio-comment@archiver.kernel.org>; Mon, 31 Jul 2023 03:21:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 64897747C4
	for <virtio-comment@archiver.kernel.org>; Mon, 31 Jul 2023 03:21:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 47CA498637C
	for <virtio-comment@archiver.kernel.org>; Mon, 31 Jul 2023 03:21:40 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 37465983D41; Mon, 31 Jul 2023 03:21:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 24B30986364
	for <virtio-comment@lists.oasis-open.org>; Mon, 31 Jul 2023 03:21:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690773698; x=1691378498;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HOcVDhkAKB+vFLcBccsxIHosVVzZo7nsDO0vN6TAyZI=;
        b=jZ7MRcFwnZh0bW8ew97D05vR5tXeNnNRQsFeyD7BOnOkKFwweDVxTJ7+JYc6BgUVEm
         GZ28Vo6xv8Ai8Oy55XXyS+6XwTlZa8TFbURZQaKB/jXrlI6KWo6f9HzOOojcbZ+B3/e6
         kTj05z+bAVjHBNAZ6qAs2pUb/B/FIn6ertdSrM55uo/RFZgwEtaWwealVDkwfKTQKUzZ
         nSMaF1RXYVTKlbV4/wwmOAFqoUZSAIVsfgafDQzbi+Al3gUul5x6BYtM/jGJv549vGRU
         ts/PGQlw5QyyAyrBmirZivEGwUyvgDo/xl2993ht8+fxcreoh27Qc4ZCoMfUn4odEg9y
         bVkQ==
X-Gm-Message-State: ABy/qLZ4Hh4UNjUkQsjDBHmm/vxfV6mmxaH6yavHhKTbckDB1WB3/Tyz
	8X6V+UG96udGYkQ1gIoNA5mJ3w==
X-Google-Smtp-Source: APBJJlFwWgGxyc0vQ3NB0V9xIH0jfe84lX1OPFbhtq6wWesoL4vDX52GOzePQ51PXqlcAWI/9vBjHA==
X-Received: by 2002:a17:903:2343:b0:1bb:a85c:23cc with SMTP id c3-20020a170903234300b001bba85c23ccmr11439412plh.15.1690773698043;
        Sun, 30 Jul 2023 20:21:38 -0700 (PDT)
Message-ID: <dede75fb-c28a-2b18-00f1-b7089f11d5ef@bytedance.com>
Date: Mon, 31 Jul 2023 11:21:21 +0800
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
 <20230626072551.1709389-8-pizhenwei@bytedance.com>
 <C273A65E-1891-4DD3-8DC9-1E40CB6378D1@nutanix.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <C273A65E-1891-4DD3-8DC9-1E40CB6378D1@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: Re: [virtio-comment] [PATCH v4 7/7] transport-fabrics: introduce
 keyed eager buffers



On 7/30/23 07:30, Raphael Norwitz wrote:
> I do think this is a very valuable addition to the protocol but it introduces complication.
> 
> The fundamental drawback is that it’s really expensive to allocate and pre-post enough memory in the target. In theory, a guest could submit <VQ size> <max IO size> IOs on all VQ connections. Assuming a 128 VQ size and 1MB IOs, that’s 128 MB per connection. That may be great for some use cases but doesn’t scale.
> 
> With the proposed design I’d worry about memory fragmentation. Maybe it would be better to have eager buffer regions for different IO size buckets per VQ? While slightly less memory efficient it would be much easier to manage.
> 

Typically, 1 eager buffer is used for 1 virtio-of queue. For example, a 
target exposes 1 eager buffer of 1M. The initiator side managers 1M as 
buddy(maybe list, or other data structures).
The initiator tries to find a suitable region from eager buffer:
1, on success, the initiator writes the eager buffer, and sends command 
in 1 RTT.
2, on failure, the initiator prepares a MR (for RDMA READ from target) 
and sends command. The the target handles command and IN buffer in 2 
RTT. (if no eager buffer supported, always select this path)

> Again, if this is just for storage device write path, why not try extend iSER or NVMF with this functionality?
> 

Let's discuss this in overview.

>> On Jun 26, 2023, at 3:25 AM, zhenwei pi <pizhenwei@bytedance.com> wrote:
>>
>> The Virtio-oF device instance can expose keyed eager buffers, the Virtio-oF
>> initiator can write device-readable virtqueue buffers and send VQ command
>> in a single RTT on the fabric, this makes better performance.
>>
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>> ---
>> transport-fabrics.tex | 81 +++++++++++++++++++++++++++++++++++++++++++
>> 1 file changed, 81 insertions(+)
>>
>> diff --git a/transport-fabrics.tex b/transport-fabrics.tex
>> index f7f29cf..b0ccfb1 100644
>> --- a/transport-fabrics.tex
>> +++ b/transport-fabrics.tex
>> @@ -194,6 +194,8 @@ \subsubsection{Opcodes}\label{sec:Virtio Transport Options / Virtio Over Fabrics
>> #define virtio_of_op_get_feature           0x0004
>> #define virtio_of_op_set_feature           0x0005
>> #define virtio_of_op_get_keyed_num_descs   0x0100
>> +#define virtio_of_op_get_keyed_eager_buf   0x0102
>> +#define virtio_of_op_vq_keyed_eager_buf    0x0ffe
>> #define virtio_of_op_vq                    0x0fff
>> #define virtio_of_op_get_vendor_id         0x1000
>> #define virtio_of_op_get_device_id         0x1001
>> @@ -349,6 +351,9 @@ \subsubsection{Opcodes}\label{sec:Virtio Transport Options / Virtio Over Fabrics
>> \begin{lstlisting}
>> /* support virtio_of_op_get_keyed_num_descs to get the maximum number of keyed descriptors */
>> #define VIRTIO_OF_F_KEYED_NUM_DESCS            0
>> +
>> +/* support virtio_of_op_get_keyed_eager_buf to get the eager buffers of the Virtio-oF virtqueues */
>> +#define VIRTIO_OF_F_KEYED_EAGER_BUF            1
>> \end{lstlisting}
>>
>> \paragraph{Set Feature Command}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Commands Definition / Opcodes / Set Feature Command}
>> @@ -407,6 +412,82 @@ \subsubsection{Opcodes}\label{sec:Virtio Transport Options / Virtio Over Fabrics
>> };
>> \end{lstlisting}
>>
>> +\paragraph{Get Keyed Eager Buffers Command}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Commands Definition / Opcodes / Get Keyed Eager Buffers Command}
>> +A Virtio-oF virtqueue may expose 0 or more keyed buffers that allow the Virtio-oF initiator to write directly to the Virtio-oF device instance.
>> +The Keyed Eager Buffers mechanism reduces round-trip time on the fabrics.
>> +The Get Keyed Eager Buffers Command is used to get the eager buffers of a Virtio-oF virtqueue,
>> +and it is executed on the Virtio-oF control queue.
>> +
>> +The structure of the Get Keyed Deager Buffers Command structure is as follows:
> 
> s/Deager/Eager
> 
>> +\begin{lstlisting}
>> +struct virtio_of_command_get_keyed_eager_buf {
>> +        /* opcode is virtio_of_op_get_keyed_eager_buf */
>> +        le16 opcode;
>> +        /* unique ID for all in-flight commands */
>> +        le16 command_id;
>> +        /* the Virtio-oF virtqueue index */
>> +        le16 vq_index;
>> +        /* the maximum number of eager buffer descriptors to obtain */
>> +        u8 descs;
>> +        u8 reserved[9];
>> +};
>> +\end{lstlisting}
>> +
>> +The Get Keyed Eager Buffers Body is a contiguous memory of \texttt{descs} elements (virtio_of_keyed_desc type).
>> +
>> +The structure of the Get Keyed Eager Buffers Completion is as follows:
>> +\begin{lstlisting}
> 
> Assuming you are going to have the initiator RDMA write to this memory, shouldn’t this include the MR key?
> 
>> +struct virtio_of_completion_get_keyed_eager_buf {
>> +        le16 status;
>> +        le16 command_id;
>> +        /* the number of eager buffer descriptors */
>> +        u8 descs;
>> +        u8 reserved[11];
>> +};
>> +\end{lstlisting}
>> +
>> +Note: multiple keyed eager buffers compose a logical memory range sequentially.
>> +To locate a position within the range, use the offset and length values as follows:
>> +\begin{lstlisting}
>> +    +-----------+-----------+     +-----------+
>> +    |addr0, len0|addr1, len1| ... |addrN, lenN|
>> +    +-----------+-----------+     +-----------+
>> +                   |                    |
>> +                   \---offset, length---/
>> +\end{lstlisting}
>> +
>> +\paragraph{VQ Keyed Eager Buffers Command}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Commands Definition / Opcodes / VQ Keyed Eager Buffers Command}
>> +The Virtio-oF initiator must write device-readable virtqueue buffers into the Virtio-oF virtqueue eager buffers,
>> +then issue The VQ Keyed Eager Buffers Command to transmit virtqueue buffers.
>> +This command is executed on the Virtio-oF virtqueue only.
>> +
>> +The structure of the VQ Keyed Eager Buffers Command structure is as follows:
>> +\begin{lstlisting}
>> +struct virtio_of_command_vq_keyed_eager_buf {
>> +        /* opcode is virtio_of_op_vq_keyed_eager_buf */
>> +        le16 opcode;
>> +        /* unique ID for all in-flight commands */
>> +        le16 command_id;
>> +        /* the offset of Virtio-oF virtqueue eager buffers */
>> +        le32 out_offset;
>> +        /* the length of device-readable virtqueue buffers */
>> +        le32 out_length;
>> +        /* the length of device-writable virtqueue buffers */
>> +        le32 in_length;
>> +};
>> +\end{lstlisting}
>> +
>> +The structure of the VQ Keyed Eager Buffers Completion is as follows:
>> +\begin{lstlisting}
>> +struct virtio_of_completion_vq_keyed_eager_buf {
>> +        le16 status;
>> +        le16 command_id;
>> +        /* the length of virtqueue buffers from Virtio-oF target */
>> +        le32 length;
>> +        u8 reserved[8];
>> +};
>> +\end{lstlisting}
>> +
>> \paragraph{VQ Command}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Commands Definition / Opcodes / VQ Command}
>> The VQ Command is used to transmit virtqueue buffers for Virtio-oF virtqueue only.
>>
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

