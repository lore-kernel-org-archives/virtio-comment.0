Return-Path: <virtio-comment-return-6920-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919A2C001DF
	for <virtio-comment@archiver.kernel.org>; Mon, 31 Jul 2023 02:28:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D49D442C23
	for <virtio-comment@archiver.kernel.org>; Mon, 31 Jul 2023 02:28:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C16C3986383
	for <virtio-comment@archiver.kernel.org>; Mon, 31 Jul 2023 02:28:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B0C9F983EB2; Mon, 31 Jul 2023 02:28:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9E657986364
	for <virtio-comment@lists.oasis-open.org>; Mon, 31 Jul 2023 02:28:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690770512; x=1691375312;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9EUPj385nVmpGKDAumvcpoqAWuuQjY5L8rSvKI/Ji5U=;
        b=DRYv6ujYvjFFX1qs5bX2P/bnqQRaA24uDt4XlmqQhL4XmZDLUh9BSMJrRSg3TDiuXE
         Tg6ScYsSTgSnmqH0E8bfkFLed1L1/2mhYS4vCkhmbeQMi5yZ0BvOoS+5GaVYpWpHUrVu
         e0taE28IFTpfkgINkZKXgCdc2iBslPZ1BIXnR48YEy53eyfWsQrp/vqKy2P84XvwyCcz
         QD//e2wX19FenCdthjRP6KlaKn3skTIf1KeBDyJ4bA4WGV3Iw8ZRDBCIo4hLTja6S5tH
         eiA3H6xn7nEW0Q2g9bfIf4Qx/hGRlq3P7U5bqXT+IvzQ7cuYZB9Vpgidd4Nm05yH1u3e
         HRyg==
X-Gm-Message-State: ABy/qLYY80Z54L7EBqlXJSdZWzrBub0eINum8xQTy0N7Ct3eh39MVXFY
	NMCIbvWM71p96iqNVT4Q79M8kg==
X-Google-Smtp-Source: APBJJlHksQnnvwWTSVfs/24O3zUfjvoggShjPIPZ9JvHNEmp5V5EGocIKwK9kXfDdZUMLsborz6ZIw==
X-Received: by 2002:a05:6a00:2d20:b0:67a:8f2a:2cb2 with SMTP id fa32-20020a056a002d2000b0067a8f2a2cb2mr10292852pfb.20.1690770512500;
        Sun, 30 Jul 2023 19:28:32 -0700 (PDT)
Message-ID: <e01e1159-6691-189b-4206-f9f3bb973198@bytedance.com>
Date: Mon, 31 Jul 2023 10:28:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, "parav@nvidia.com"
 <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "houp@yusur.tech" <houp@yusur.tech>,
 "zhouhuaping.san@bytedance.com" <zhouhuaping.san@bytedance.com>,
 "xinhao.kong@duke.edu" <xinhao.kong@duke.edu>
References: <20230626072551.1709389-1-pizhenwei@bytedance.com>
 <20230626072551.1709389-4-pizhenwei@bytedance.com>
 <3F9E10F5-F231-4C0B-ADEA-55A7AEAD48BA@nutanix.com>
Content-Language: en-US
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <3F9E10F5-F231-4C0B-ADEA-55A7AEAD48BA@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: Re: [virtio-comment] [PATCH v4 3/7] transport-fabrics: introduce
 Virtio-oF Protocol Data Unit



On 7/30/23 07:25, Raphael Norwitz wrote:
> I’d suggest making some tweaks to save memory on the target side for RDMA.
> 
>> On Jun 26, 2023, at 3:25 AM, zhenwei pi <pizhenwei@bytedance.com> wrote:
>>
>> Introduce Virtio-oF PDU for Virtio-oF queue, add Stream Data Transfers
>> and Keyed Data Transfers mechanism.
>>
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>> ---
>> transport-fabrics.tex | 68 +++++++++++++++++++++++++++++++++++++++++++
>> 1 file changed, 68 insertions(+)
>>
>> diff --git a/transport-fabrics.tex b/transport-fabrics.tex
>> index 54d7558..d562b2c 100644
>> --- a/transport-fabrics.tex
>> +++ b/transport-fabrics.tex
>> @@ -45,3 +45,71 @@ \subsection{Virtio-oF Qualified Name}\label{sec:Virtio Transport Options / Virti
>> \item The maximum name is 256 bytes in length, including the NUL character.
>> \item There is no strict style limitation.
>> \end{itemize}
>> +
>> +
>> +\subsection{Protocol Data Unit}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Protocol Data Unit}
>> +This section defines Virtio-oF Protocol Data Unit (PDU) for both the Virtio-oF control queue and Virtio-oF virtqueue.
>> +
>> +Virtio-oF PDU is a unit of information exchanged between a Virtio-oF initiator and a Virtio-oF target:
>> +\begin{itemize}
>> +\item A request Virtio-oF PDU from Virtio-oF initiator to Virtio-oF target contains command and associated data, if present.
>> +\item A response Virtio-oF PDU from Virtio-oF target to Virtio-oF initiator contains completion and associated data, if present.
>> +\end{itemize}
>> +
>> +\subsubsection{Stream Data Transfers}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Protocol Data Unit/ Stream Data Transfers}
>> +Stream-based (i.e. TCP/IP) Virtio-oF queue transfers Virtio-oF PDUs in a streaming fashion.
>> +
>> +The layout in a stream:
>> +\begin{lstlisting}
>> +PDUx and PDUz contain a command only, PDUy contains a command and data:
>> +
>> +     +----+     +---------+     +----+
>> +     |PDUx|     |   PDUy  |     |PDUz|
>> + ... +----+ ... +----+----+ ... +----+ ...
>> +     |CMD |     |CMD |Data|     |CMD |
>> +     +----+     +---------+     +----+
>> +
>> +PDUl contains completion only, PDUm and PDUn contain completion and data:
>> +
>> +     +----+     +---------+     +---------+
>> +     |PDUl|     |   PDUm  |     |   PDUn  |
>> + ... +----+ ... +----+----+ ... +----+----+ ...
>> +     |COMP|     |COMP|Data|     |COMP|Data|
>> +     +----+     +---------+     +---------+
>> +\end{lstlisting}
>> +
>> +\subsubsection{Keyed Data Transfers}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Protocol Data Unit/ Keyed Data Transfers}
>> +Message-based (i.e. RDMA) Virtio-oF queue transfers Virtio-oF PDUs in a message fashion, and uses the following structure to describe the remote data:
>> +
>> +\begin{lstlisting}
>> +struct virtio_of_keyed_desc {
>> +        /* the remote address of data */
>> +        le64 addr;
>> +        /* the length of data */
>> +        le32 length;
>> +        /* the key to access the remote data */
>> +        le32 key;
>> +};
>> +\end{lstlisting}
>> +
>> +A Virtio-oF control queue supports 1 keyed descriptor, and a Virtio-oF virtqueue supports 1 or more keyed descriptors.
>> +
>> +The PDUs of messages:
>> +\begin{lstlisting}
>> +PDUx contains a command only, PDUy contains a command and 1 descriptor,
>> +and PDUz contains a command and k - j + 1 descriptors.
>> +
>> +     +----+     +---------+     +--------------------+
>> +     |PDUx|     |   PDUy  |     |        PDUz        |
>> + ... +----+ ... +----+----+ ... +----+-----+---+-----+ ...
>> +     |CMD |     |CMD |DESC|     |CMD |DESCj|...|DESCk|
>> +     +----+     +---------+     +----------+---+-----+
> 
> On the target side you have to prepost (MAX_SG_LEN * sizeof(virtio_of_keyed_desc) + sizeof(virtio_command_vq)) * max outstanding for each connection.
> 
> Assuming a 128 max outstanding and MAX_SG_LEN=1024 (QEMU’s IOV_INTERNAL) that puts you at (1024 * 8 + 13) * 128 ~= 1MB per connection. If a target is servicing thousands of connections that adds up.
> 
> I’d suggest adding a protocol message to cap the MAX_SG_LEN and communicate the value to the target.
> 
> Would also be great to save space in virtio_of_keyed_desc, but I don’t think there is a way.
> 

Hi,

I have to say that the virtio_of_keyed_desc is not 1:1 mapping to VQ desc.

MAX_SG_LEN is supposed at least 1(by default): then 1 memory region is 
used for both WRITE and READ direction. Example of virtio-blk write 
128k, 1 virtio_of_keyed_desc describes a MR of 16(OUT: virtio-blk 
header) + 128K(OUT: blk data) + 1(IN: u8 status)

Or MAX_SG_LEN is 2, then we can separate OUT vq buffers and IN vq 
buffers into 2 MR described by 2 virtio_of_keyed_desc.

'Get Keyed Number Descriptors Command' (from [PATCH 4/7] 
transport-fabrics: introduce command set) is used to get the 'MAX_SG_LEN'.

>> +
>> +PDUl, PDUm, and PDUn contain completion only.
>> +
>> +     +----+     +----+     +----+
>> +     |PDUl|     |PDUm|     |PDUn|
>> + ... +----+ ... +----+ ... +----+ ...
>> +     |COMP|     |COMP|     |COMP|
>> +     +----+     +----+     +----+
>> +\end{lstlisting}
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

