Return-Path: <virtio-comment-return-6198-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F4EC7EE2F
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 03:01:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7E00D2ACA5
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 03:01:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 576AC98664A
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 03:01:01 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 41E5798381B; Wed,  7 Jun 2023 03:01:01 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2DC05986603
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Jun 2023 03:01:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686106859; x=1688698859;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9AdW07GkWFubuuAYnOKuAlhWfgKblGh10r6NIPm0JFU=;
        b=Q9Ezo8t0hKk0+2F7nvnrlUeSGxavZA4G6DPXhotq/YYELAUKAMs6KHCr4RSHCJu8/Q
         b4WV/6JFaPualYaw36KBUjj1nqXNi/gdiV+z+mBoOMhXE7/SggBUiBKF7xTUwfOxoFzx
         i6VCniG/TSnrbpYI4GdOUCfrjlvLN5/7yd7hujQKPF49CvTDe17zENpEj/sF1z8q4cMm
         CgnjmEcicqaNRFpL/GBafwW7nCYDPOk/UqKK8dix+t3nCGorr9S9OVHkHd5zJrGukS08
         G6+MG4PS6uvBPrkN4sP3Aj+yz8b+sIpeWjAorxd5+kfH+hCqFVLASDfwJV0w7NBbeQti
         yvSA==
X-Gm-Message-State: AC+VfDyH4aJkLtLVlKJaFEfDPxBBwfiFay7eFFFWMoqgxAyvPoSOGMTY
	SlTKK8BnBZRv9cIla2P2dCpMGw==
X-Google-Smtp-Source: ACHHUZ7VazUuTRSHyls3Z3YlSYWky71GBX7UERRCkaIflB7I8Qu0vBgvks9NVwFTe+cBGhkgt72RpA==
X-Received: by 2002:a05:6a00:2e89:b0:657:aa95:70cf with SMTP id fd9-20020a056a002e8900b00657aa9570cfmr5005872pfb.28.1686106858717;
        Tue, 06 Jun 2023 20:00:58 -0700 (PDT)
Message-ID: <86978fc3-c065-5a64-2996-28b4eb2b40bd@bytedance.com>
Date: Wed, 7 Jun 2023 10:58:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: parav@nvidia.com, mst@redhat.com, jasowang@redhat.com,
 virtio-comment@lists.oasis-open.org, houp@yusur.tech,
 helei.sig11@bytedance.com, xinhao.kong@duke.edu
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-7-pizhenwei@bytedance.com>
 <20230531171036.GH1248296@fedora>
 <8cfdc9bf-03c9-92fc-f2e0-d59b180b0d82@bytedance.com>
 <20230605163046.GB1624556@fedora>
 <54bb85af-7979-8226-cfef-d72c1cf2332f@bytedance.com>
 <20230606133444.GC1958291@fedora>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20230606133444.GC1958291@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [virtio-comment] Re: Re: Re: Re: [PATCH v2 06/11] transport-fabrics: introduce command
 set



On 6/6/23 21:34, Stefan Hajnoczi wrote:
> On Tue, Jun 06, 2023 at 09:31:27AM +0800, zhenwei pi wrote:
>> On 6/6/23 00:30, Stefan Hajnoczi wrote:
>>> On Fri, Jun 02, 2023 at 01:15:00PM +0800, zhenwei pi wrote:
>>>>
>>>>
>>>> On 6/1/23 01:10, Stefan Hajnoczi wrote:
>>>>> On Thu, May 04, 2023 at 04:19:05PM +0800, zhenwei pi wrote:
>>>>>> Introduce command structures for Virtio-oF.
>>>>>>
>>>>>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>>>>>> ---
>>>>>>     transport-fabrics.tex | 209 ++++++++++++++++++++++++++++++++++++++++++
>>>>>>     1 file changed, 209 insertions(+)
>>>>>>
>>>>>> diff --git a/transport-fabrics.tex b/transport-fabrics.tex
>>>>>> index 7711321..37f57c6 100644
>>>>>> --- a/transport-fabrics.tex
>>>>>> +++ b/transport-fabrics.tex
>>>>>> @@ -495,3 +495,212 @@ \subsubsection{Buffer Mapping Definition}\label{sec:Virtio Transport Options / V
>>>>>>                         |value |  -> 8193 (value.u32)
>>>>>>                         +------+
>>>>>>     \end{lstlisting}
>>>>>> +
>>>>>> +\subsubsection{Commands Definition}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition}
>>>>>> +This section defines command structures for Virtio Over Fabrics.
>>>>>> +
>>>>>> +A common structure virtio_of_value is fixed to 8 bytes and MUST be used as one
>>>>>> +of the following format:
>>>>>> +
>>>>>> +\begin{itemize}
>>>>>> +\item u8
>>>>>> +\item le16
>>>>>> +\item le32
>>>>>> +\item le64
>>>>>> +\end{itemize}
>>>>>
>>>>> The way it's written does not document where the u8, u16, u32 bytes are
>>>>> located and that the unused bytes are 0. I think I understand what you
>>>>> mean though:
>>>>>
>>>>>      le64 value = cpu_to_le64((u64)v); /* v is u8, u16, u32, or u64 */
>>>>>
>>>>> Please clarify.
>>>>>
>>>>
>>>> I want to describe an union structure of 8 bytes:
>>>> union virtio_of_value {
>>>>       u8;
>>>>       u16;
>>>>       u32;
>>>>       u64;
>>>> };
>>>>
>>>> Depending on the opcode, use the right one.
>>>
>>> I was trying to point out that the memory layout of C unions is not
>>> portable. Your example does not define the exact in-memory layout of
>>> union virtio_of_value. Here is the first web search result I found about
>>> this topic:
>>>
>>>     "Q: And a related question: if you dump unions in binary form to a file,
>>>     and then reload them from the file on a different platform, or with a
>>>     program compiled by a different compiler, are you guaranteed to get
>>>     back what you stored? (I think not, but I'm not sure)
>>>
>>>     A: You're right; you're not."
>>>
>>>     https://bytes.com/topic/c/answers/220372-unions-storage-abis
>>>
>>> In the cpu_to_le64() code example that I gave, the exact in-memory
>>> layout is well-defined. There is no ambiguity.
>>>
>>
>> OK, thanks.
>>
>>>>>> +\hline
>>>>>> +0xff00 - 0xfffd & Reserved \\
>>>>>> +\hline
>>>>>> +\end{tabular}
>>>>>> +
>>>>>> +\paragraph{Connect Command}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Connect Command}
>>>>>> +The Connect Command is used to establish Virtio Over Fabrics queue. The control
>>>>>> +queue MUST be established firstly, then the Connect command establishes an
>>>>>> +association between the initiator and the target.
>>>>>
>>>>> Is a "Virtio Over Fabrics queue" different from a virtqueue?
>>>>>
>>>>> If I understand correctly, the control queue must be established by the
>>>>> initiator first and then the Connect command is sent to begin
>>>>> communication between the initiator and the target?
>>>>>
>>>>
>>>> The queue mapping is missing in the '[PATCH v2 01/11] transport-fabrics:
>>>> introduce Virtio Over Fabrics overview', like:
>>>> A "Virtio Over Fabrics queue" is a reliable connection between initiator and
>>>> target. There are 2 types of Virtio Over Fabrics queue:
>>>> +\begin{itemize}
>>>> +\item A single Control queue is required to execute control operations.
>>>> +\item 0 or more Virtio Over Fabrics queues map the virtqueues.
>>>> +\end{itemize}
>>>
>>> That helps, thanks!
>>>
>>>>
>>>>>> +
>>>>>> +The Target ID of 0xffff is reserved, then:
>>>>>
>>>>> Please move this after the fields have been shown and the purpose of the
>>>>> Target ID field has been explained.
>>>>>
>>>>>> +\begin{itemize}
>>>>>> +\item The Target ID of 0xffff MUST be specified as the Target ID in a Connect
>>>>>> +Command for the control queue.
>>>>>> +\item The target SHOULD allocate any available Target ID to the initiator,
>>>>>> +and return the allocated Target ID in the Completion.
>>>>>> +\item The returned Target ID MUST be specified as the Target ID, and the Queue ID
>>>>>> +MUST be specified in a Connect Command for the virtqueue.
>>>>>> +\end{itemize}
>>>>>
>>>>> What is the purpose of the Target ID? Is it to allow a server to provide
>>>>> access to multiple targets over the same connection?
>>>>>
>>>>
>>>> A target listens on a port, and provides access to 0 or more targets. An
>>>> initiator connect the specific target by TVQN of connect command.
>>>> An initiator could connect a single target, multiple initiators could
>>>> connect the same target(typically, shared disk/fs).
>>>
>>> Why is the target ID separate from the TVQN? If the Target ID is a
>>> separate parameter then users will have to learn additional
>>> syntax/command-line options to specify the TVQN + Target ID and that
>>> syntax may vary between software.
>>>
>>>>
>>>>>> +
>>>>>> +The Connect Command has following structure:
>>>>>> +
>>>>>> +\begin{lstlisting}
>>>>>> +struct virtio_of_command_connect {
>>>>>> +        le16 opcode;
>>>>>> +        le16 command_id;
>>>>>> +        le16 target_id;
>>>>>> +        le16 queue_id;
>>>>>> +        le16 ndesc;
>>>>>
>>>>> Where is this field documented?
>>>>>
>>>>
>>>> OK. Will add.
>>>>
>>>>> Why does the initiator send ndesc to the target? Normally a VIRTIO Transport reports the device's max descriptors and then the driver can tell the device to reduce the number of descriptors, if desired.
>>>>>
>>>>
>>>> A target supports at lease 1 descriptor. The 'ndesc' of struct
>>>> virtio_of_command_connect indicates the full PDU contains: struct
>>>> virtio_of_command_connect + 1 * virtio_of_vq_desc + data.
>>>>
>>>>>> +#define VIRTIO_OF_CONNECTION_TCP     1
>>>>>> +#define VIRTIO_OF_CONNECTION_RDMA    2
>>>>>
>>>>> What does RDMA mean? I thought RDMA is a general concept that several
>>>>> fabrics implement (with different details like how addressing works).
>>>>>
>>>>
>>>> I guest your concern is the difference of IB/RoCE/iWarp ...
>>>> We are trying to define the payload protocol here, so I think we can ignore
>>>> the difference of the HCA.
>>>
>>> I see, maybe this could be called STREAM vs KEYED instead of TCP vs RDMA?
>>>
>>
>> I'd like to define two PDU mapping rules(in '[PATCH v2 04/11]
>> transport-fabrics: introduce Stream Transmission' and '[PATCH v2 05/11]
>> transport-fabrics: introduce Keyed Transmission'): STREAM and KEYED. A
>> transport protocols need to use one.
>>
>> Then we can define protocols:
>> #define VIRTIO_OF_CONNECTION_TCP     1		-> use STREAM
>> #define VIRTIO_OF_CONNECTION_RDMA    2		-> use KEYED
>> #define VIRTIO_OF_CONNECTION_TLS     3(in the future)	-> use STREAM
>> #define VIRTIO_OF_CONNECTION_XXX
> 
> It's not clear to me whether TCP actually means TCP/IP or if it actually
> means STREAM. For example, if I run Virtio Over Fabrics over AF_VSOCK,
> would it use VIRTIO_OF_CONNECTION_TCP although there is no TCP/IP? If
> so, then I think the name TCP is misleading and STREAM would be clearer.
> 

What about dropping 'oftype' field from this command? When the command 
is allowed to issue, the reliable connection is already established, at 
this point, we have enough information about the connection type.

Instead, we define the multiple transports in the following section, like:
\subsection{Transport Binding}\label{sec:Virtio Transport Options / 
Virtio Over Fabrics / Transport Binding}
\subsubsection{TCP/IP}\label{sec:Virtio Transport Options / Virtio Over 
Fabrics / Transport Binding / TCP_IP}
TCP/IP supports both IPv4 and IPv6, it uses \ref{sec:Virtio Transport 
Options / Virtio Over Fabrics / Transmission Protocol / Commands 
Definition / Stream Transmission}
~\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / 
Transmission Protocol / Commands Definition / Stream Transmission} ...

\subsubsection{TLS-TCP/IP}\label{sec:Virtio Transport Options / Virtio 
Over Fabrics / Transport Binding / TLS-TCP_IP}
TLS-TCP/IP supports both IPv4 and IPv6 ...

\subsubsection{RDMA}\label{sec:Virtio Transport Options / Virtio Over 
Fabrics / Transport Binding / RDMA}
RDMA MUST use \ref{sec:Virtio Transport Options / Virtio Over Fabrics / 
Transmission Protocol / Commands Definition / Keyed Transmission}
~\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / 
Transmission Protocol / Commands Definition / Keyed Transmission} ...

[\subsubsection{TCP/VSOCK}\label{sec:Virtio Transport Options / Virtio 
Over Fabrics / ransport Binding / TCP_VSOCK} ...]

>>
>>>>
>>>>>> +        u8 oftype;
>>>>>> +        u8 padding[5];
>>>>>> +};
>>>>>> +\end{lstlisting}
>>>>>> +
>>>>>> +The Connect commands MUST contains one Segment Descriptor and one structure
>>>>>> +virtio_of_command_connect to specify Initiator VQN and Target VNQ,
>>>>>> +virtio_of_command_connect has following structure:
>>>>>
>>>>> I'm confsued. virtio_of_command_connect was defined above. The struct
>>>>> defined below is virtio_of_connect. Does this paragraph need to be
>>>>> updated (virtio_of_command_connect -> virtio_of_connect)?
>>>>>
>>>>> Why is virtio_of_connect a separate struct and not part of
>>>>> virtio_of_command_connect?
>>>>>
>>>>
>>>> Because I'd like to define all the commands with a fixed length.
>>>
>>> I don't understand. virtio_of_connect and virtio_of_command_connect are
>>> both fixed-length. Why can't they be unified into 1 fixed-length struct?
>>>
>>
>> For stream protocol, it always work fine.
>> For keyed protocol, for example RDMA, the target side needs to use
>> ibv_post_recv to receive a large size(sizeof virtio_of_command_connect +
>> sizeof virtio_of_connect). If the target uses ibv_post_recv to receive
>> sizeof(CMD) + sizeof(DESC) * 1, the initiator fails in RDMA SEND.
> 
> I read that "A RC connection is very similar to a TCP connection" in the
> NVIDIA documentation
> (https://docs.nvidia.com/networking/display/RDMAAwareProgrammingv17/Transport+Modes)
> and expected SOCK_STREAM semantics for RDMA SEND.
> 
> Are you saying ibv_post_send() fails when the receiver's work request
> sg_list size is smaller (fewer bytes) than the sender's?
> 

Yes, it will fail.
The receiver get a CQE with status 'IBV_WC_LOC_LEN_ERR', see
https://www.rdmamojo.com/2013/02/15/ibv_poll_cq/

> Does the receiver have just 1 WR queued in your example? 

No, the receiver need queue WRs of 'depth', generally the 'depth' is the 
virtqueue size.

What happens if
> the receiver queues multiple small WRs?
> 
> Stefan

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

