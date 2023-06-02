Return-Path: <virtio-comment-return-6092-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C35C7EE24
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 05:20:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DADB52AF8A
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 05:20:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by host09.ws5.connectedcommunity.org (Postfix) with QMQP
	id C4430330B6; Fri,  2 Jun 2023 05:20:26 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 231C49867DB
	for <virtio-comment@lists.oasis-open.org>; Fri,  2 Jun 2023 05:19:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685683162; x=1688275162;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XxxqhIceCnTSdigMkb1kJtvr9vODraO2nmO7hTExe2I=;
        b=GkvCLrzEI6aoXQ0AsAFkieSI7qDSmHbbbJqlQKbAC1c3miPiwocIONtg6lvJ7jztOG
         9yYLVoa2HF7KMBkgcPqlPjCOUdNKpeNvzToaKh0bBA05he1r7bmAyf3bvXiNywNnO1g/
         SenvVNsML65s80YhFZduagb72qmpuRyjNB/CkbUR5/L6zmXGahk36H1mSj5lX1c66QbO
         rcYcfzUv4+DEoI4Cg3S/ve/aPZMfGjCKTnzWaGop4QC99CwAGUTfgfzvuAzscn2lJNTh
         rPPYCCstYKOUocdyxwmrYtbE9764v7t7sIAXsLf7XUgjG1s3zZZzizNKurloQufy23x0
         ldYg==
X-Gm-Message-State: AC+VfDxDn1qHNLO4JRJg1iZbDcYztjMMPkc4BglRBp3RtSZGGaDuz2gB
	HMVr4be4aQ5V51uMh9RXZRrYXQ==
X-Google-Smtp-Source: ACHHUZ6GlsYCRMjSLvXOTP1nRxe2MbOHmcma0HdcmOZdK/3ceIu0pfeiIB9nwr+i3nRTzika9jausQ==
X-Received: by 2002:a17:903:2292:b0:1ac:a6b0:1c87 with SMTP id b18-20020a170903229200b001aca6b01c87mr1814032plh.48.1685683162495;
        Thu, 01 Jun 2023 22:19:22 -0700 (PDT)
Message-ID: <8cfdc9bf-03c9-92fc-f2e0-d59b180b0d82@bytedance.com>
Date: Fri, 2 Jun 2023 13:15:00 +0800
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
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20230531171036.GH1248296@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [virtio-comment] Re: Re: [PATCH v2 06/11] transport-fabrics: introduce command set



On 6/1/23 01:10, Stefan Hajnoczi wrote:
> On Thu, May 04, 2023 at 04:19:05PM +0800, zhenwei pi wrote:
>> Introduce command structures for Virtio-oF.
>>
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>> ---
>>   transport-fabrics.tex | 209 ++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 209 insertions(+)
>>
>> diff --git a/transport-fabrics.tex b/transport-fabrics.tex
>> index 7711321..37f57c6 100644
>> --- a/transport-fabrics.tex
>> +++ b/transport-fabrics.tex
>> @@ -495,3 +495,212 @@ \subsubsection{Buffer Mapping Definition}\label{sec:Virtio Transport Options / V
>>                       |value |  -> 8193 (value.u32)
>>                       +------+
>>   \end{lstlisting}
>> +
>> +\subsubsection{Commands Definition}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition}
>> +This section defines command structures for Virtio Over Fabrics.
>> +
>> +A common structure virtio_of_value is fixed to 8 bytes and MUST be used as one
>> +of the following format:
>> +
>> +\begin{itemize}
>> +\item u8
>> +\item le16
>> +\item le32
>> +\item le64
>> +\end{itemize}
> 
> The way it's written does not document where the u8, u16, u32 bytes are
> located and that the unused bytes are 0. I think I understand what you
> mean though:
> 
>    le64 value = cpu_to_le64((u64)v); /* v is u8, u16, u32, or u64 */
> 
> Please clarify.
> 

I want to describe an union structure of 8 bytes:
union virtio_of_value {
     u8;
     u16;
     u32;
     u64;
};

Depending on the opcode, use the right one.

>> +
>> +\paragraph{Command ID}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Command ID}
>> +There is command_id(le16) field in each Command and Completion:
> 
> "is a command_id"
> 

OK.

>> +
>> +\begin{itemize}
>> +\item Generally the initiator allocates a Command ID and specifies the
> 
> "allocates a Command ID that is unique for all in-flight commands"?
> 

Yes. Will add.

>> +command_id field of a Command, and the target MUST specify the same Command ID
> 
> The "MUST" statement needs to be in a driver-normative section. You can
> keep the sentence in this non-normative section by tweaking it:
> "target specifies"
> 
> The idea is that all MUST/SHOULD/etc statements are in a separate
> device/driver-normative section so that they can be easily reviewed by
> device/driver implementers without re-reading the entire text.
> 

OK.

>> +in command_id field of Completion.
>> +\item The initiator MUST guarantee each Command ID is unique in the inflight Commands.
> 
> Same here about "MUST".
> 
>> +\item Command ID 0xff00 - 0xffff is reserved for control queue to delivery asynchronous event.
> 
> "for control queue asynchronous events"
> 

OK.

>> +\end{itemize}
>> +
>> +The reserved Command ID for control queue is defined as follows:
> 
> "The reserved Command IDs for the control queue are as follows:"
> 
>> +
>> +\begin{tabular}{ |l|l| }
>> +\hline
>> +Command ID & Description \\
>> +\hline \hline
>> +0xffff & Keepalive. The initiator SHOULD ignore this event \\
> 
> "Ignored by the initiator." + move the SHOULD statement to a
> driver-normative section.
> 
>> +\hline
>> +0xfffe & Config change. The initiator SHOULD generate config change interrupt to device \\
> 
> "Causes the initiator to generate a configuration change notification."
> 
>> +\hline
>> +0xff00 - 0xfffd & Reserved \\
>> +\hline
>> +\end{tabular}
>> +
>> +\paragraph{Connect Command}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Connect Command}
>> +The Connect Command is used to establish Virtio Over Fabrics queue. The control
>> +queue MUST be established firstly, then the Connect command establishes an
>> +association between the initiator and the target.
> 
> Is a "Virtio Over Fabrics queue" different from a virtqueue?
> 
> If I understand correctly, the control queue must be established by the
> initiator first and then the Connect command is sent to begin
> communication between the initiator and the target?
> 

The queue mapping is missing in the '[PATCH v2 01/11] transport-fabrics: 
introduce Virtio Over Fabrics overview', like:
A "Virtio Over Fabrics queue" is a reliable connection between initiator 
and target. There are 2 types of Virtio Over Fabrics queue:
+\begin{itemize}
+\item A single Control queue is required to execute control operations.
+\item 0 or more Virtio Over Fabrics queues map the virtqueues.
+\end{itemize}

>> +
>> +The Target ID of 0xffff is reserved, then:
> 
> Please move this after the fields have been shown and the purpose of the
> Target ID field has been explained.
> 
>> +\begin{itemize}
>> +\item The Target ID of 0xffff MUST be specified as the Target ID in a Connect
>> +Command for the control queue.
>> +\item The target SHOULD allocate any available Target ID to the initiator,
>> +and return the allocated Target ID in the Completion.
>> +\item The returned Target ID MUST be specified as the Target ID, and the Queue ID
>> +MUST be specified in a Connect Command for the virtqueue.
>> +\end{itemize}
> 
> What is the purpose of the Target ID? Is it to allow a server to provide
> access to multiple targets over the same connection?
> 

A target listens on a port, and provides access to 0 or more targets. An 
initiator connect the specific target by TVQN of connect command.
An initiator could connect a single target, multiple initiators could 
connect the same target(typically, shared disk/fs).

>> +
>> +The Connect Command has following structure:
>> +
>> +\begin{lstlisting}
>> +struct virtio_of_command_connect {
>> +        le16 opcode;
>> +        le16 command_id;
>> +        le16 target_id;
>> +        le16 queue_id;
>> +        le16 ndesc;
> 
> Where is this field documented?
> 

OK. Will add.

> Why does the initiator send ndesc to the target? Normally a VIRTIO Transport reports the device's max descriptors and then the driver can tell the device to reduce the number of descriptors, if desired.
> 

A target supports at lease 1 descriptor. The 'ndesc' of struct 
virtio_of_command_connect indicates the full PDU contains: struct 
virtio_of_command_connect + 1 * virtio_of_vq_desc + data.

>> +#define VIRTIO_OF_CONNECTION_TCP     1
>> +#define VIRTIO_OF_CONNECTION_RDMA    2
> 
> What does RDMA mean? I thought RDMA is a general concept that several
> fabrics implement (with different details like how addressing works).
> 

I guest your concern is the difference of IB/RoCE/iWarp ...
We are trying to define the payload protocol here, so I think we can 
ignore the difference of the HCA.

>> +        u8 oftype;
>> +        u8 padding[5];
>> +};
>> +\end{lstlisting}
>> +
>> +The Connect commands MUST contains one Segment Descriptor and one structure
>> +virtio_of_command_connect to specify Initiator VQN and Target VNQ,
>> +virtio_of_command_connect has following structure:
> 
> I'm confsued. virtio_of_command_connect was defined above. The struct
> defined below is virtio_of_connect. Does this paragraph need to be
> updated (virtio_of_command_connect -> virtio_of_connect)?
> 
> Why is virtio_of_connect a separate struct and not part of
> virtio_of_command_connect?
> 

Because I'd like to define all the commands with a fixed length.

>> +
>> +\begin{lstlisting}
>> +struct virtio_of_connect {
>> +        u8 ivqn[256];
>> +        u8 tvqn[256];
> 
> If the initiator is already sends tvqn, why also have target_id?
> 
>> +        u8 padding[512];
>> +};
>> +\end{lstlisting}
>> +
>> +\paragraph{Feature Command}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Feature Command}
>> +
>> +The control queue uses Feature Command to get or set features. This command is used for:
>> +
>> +\begin{itemize}
>> +\item The initiator/target features. This is used to negotiate transport layer features.
>> +\item The driver/device features. This is used to negotiate Virtio Based device
>> +features which is similar to PCI based device.
> 
> Please do not make references to the PCI Transport.
> 

OK.

>> +\end{itemize}
>> +
>> +The Feature Command has following structure:
>> +
>> +\begin{lstlisting}
>> +struct virtio_of_command_feature {
>> +        le16 opcode;
>> +        le16 command_id;
>> +        le32 feature_select;
>> +        le64 value;        /* ignore this field on GET */
>> +};
>> +\end{lstlisting}
> 
> I guess the opcode tells the target whether this is a VIRTIO Features
> Get, VIRTIO Features Set, VIRTIO-Over-Fabrics Features Get, or
> VIRTIO-Over-Fabrics Features Set command? Please document the opcodes
> here and also include a full opcode table somewhere else.
> 
>> +
>> +\paragraph{Queue Command}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Queue Command}
>> +
>> +The control queue uses Queue Command to get or set properties on a specific queue.
>> +The Queue Command has following structure:
>> +
>> +\begin{lstlisting}
>> +struct virtio_of_command_queue {
>> +        le16 opcode;
>> +        le16 command_id;
>> +        le16 queue_id;
> 
> Does "queue" mean virtqueue here? Or does it also apply to the control
> queue? If it's a virtqueue, please call this vq_id.
> 
>> +        u8 padding6;
>> +        u8 padding7;
>> +        struct virtio_of_value value;   /* ignore this field on GET */
>> +};
>> +\end{lstlisting}
> 
> The opcode and their semantics are not documented.
> 
>> +\paragraph{Config Command}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Config Command}
>> +
>> +The control queue uses Config Command to get or set configure on device.
>> +The Config Command has following structure:
> 
> I suggest choosing a different name to avoid confusion with the
> VIRTIO Configuration Space.
> 
>> +
>> +\begin{lstlisting}
>> +struct virtio_of_command_config {
>> +        le16 opcode;
>> +        le16 command_id;
>> +        le16 offset;
>> +        u8 bytes;
>> +        u8 padding7;
>> +        struct virtio_of_value value;        /* ignore this field on GET */
>> +};
>> +\end{lstlisting}
>> +
>> +The bytes field supports on Get only:
>> +
>> +\begin{itemize}
>> +\item 1, then the initiator reads from value field of Completion as u8
>> +\item 2, then the initiator reads from value field of Completion as le16
>> +\item 4, then the initiator reads from value field of Completion as le32
>> +\item 8, then the initiator reads from value field of Completion as le64
>> +\end{itemize}
>> +
>> +The bytes field supports on Set only:
>> +
>> +\begin{itemize}
>> +\item 1, then the initiator specifies the value field of Config Command as u8
>> +\item 2, then the initiator specifies the value field of Config Command as le16
>> +\item 4, then the initiator specifies the value field of Config Command as le32
>> +\item 8, then the initiator specifies the value field of Config Command as le64
>> +\end{itemize}
> 
> I have no idea what virtio_of_command_config does because the opcodes
> aren't documented.
> 
>> +
>> +\paragraph{Common Command}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Common Command}
>> +
>> +The control queue uses Common Command to get or set common properties on
>> +device(i.e. get device ID). The Common Command has following structure:
>> +
>> +\begin{lstlisting}
>> +struct virtio_of_command_common {
>> +        le16 opcode;
>> +        le16 command_id;
>> +        u8 padding4;
>> +        u8 padding5;
>> +        u8 padding6;
>> +        u8 padding7;
>> +        struct virtio_of_value value;        /* ignore this field on GET */
>> +};
>> +\end{lstlisting}
>> +
>> +
>> +\paragraph{Vring Command}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Vring Command}
>> +
>> +Both control queue and virtqueue use Vring Command to transmit buffer.
>> +The Vring Command has following structure:
>> +
>> +\begin{lstlisting}
>> +struct virtio_of_command_vring {
>> +        le16 opcode;
>> +        le16 command_id;
>> +        /* Total buffer size this command contains(not include command&descriptors). */
>> +        le32 length;
>> +        /* How many descriptors this command contains */
>> +        le16 ndesc;
>> +        u8 padding[6];
>> +};
>> +\end{lstlisting}
>> +
>> +\paragraph{Completion}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Completion}
>> +
>> +The target responses Completion to the initiator to report command status,
>> +device properties, and transmit buffer. The Completion has following structure:
>> +
>> +\begin{lstlisting}
>> +struct virtio_of_completion {
>> +        le16 status;
>> +        le16 command_id;
>> +        /* How many descriptors this completion contains */
>> +        le16 ndesc;
>> +        u8 rsvd6;
>> +        u8 rsvd7;
>> +        struct virtio_of_value value;
>> +};
>> +\end{lstlisting}
>> +
>> +Note that Virtio Over Fabrics does not define an interrupt mechanism, generally
>> +the initiator receives a Completion, it SHOULD generate a host interrupt
>> +(if no interrupt suspending on device).
> 
> It's not possible to review this patch because these structs aren't used
> yet and the opcodes are undefined.
> 
> Defining structs that are shared by multiple opcodes might make
> implementations cleaner, but I think it makes the spec less clear. I
> would rather have a list of all opcodes and each one shows the full
> command layout (even if it is duplicated). That way it's very easy to
> look up an opcode you are implementing or debugging and check what's
> needed. If the command layout is not documented in a single place, then
> it takes more effort to figure out how an opcode works.
> 
> Stefan

OK, I'll merge the structure definition into the opcode definition.

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

