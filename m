Return-Path: <virtio-comment-return-6546-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896DBC0015E
	for <virtio-comment@archiver.kernel.org>; Tue, 27 Jun 2023 09:05:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 921626035B
	for <virtio-comment@archiver.kernel.org>; Tue, 27 Jun 2023 09:05:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1501E986821
	for <virtio-comment@archiver.kernel.org>; Tue, 27 Jun 2023 09:05:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 72A18986410; Tue, 27 Jun 2023 09:05:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 967EE98635C
	for <virtio-comment@lists.oasis-open.org>; Tue, 27 Jun 2023 09:04:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Oa9YhzEUPRSIzITK1emKtQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687856678; x=1690448678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6pC5x8yOL9ePQALHgyf3DFnqTQGB3fnxdrauUTbK2js=;
        b=PFR+CuLwtmQjOo0bKGc2gYdD3varMF2Mgo7OMSvr5Q1jcW5Z3wC4ARNwVtrKdb7+E+
         zjP9pEUJBX9jERAtDO0y9YOCaMDC9RNEcwdUb0jW+CnXeeoUlwM4fTRFqMc0S3B9Fnf7
         8k+bHq3wbAxU6tBsP4JTgQ3YTXaZeAU+o11lA1rMWJCf03GKqAX7ZHNrS8677plKcYq7
         diqLbaorPHqdIzug6BXmigug6lul4bHFU+AxtwicvvIdEhiSqTwdNrCjRh/1M9zYILjf
         mnSuitWLLjquMornGpmgrw0GQdb+jHojvuNVBlsdEPGf2gjKWMHsVEvrKMHHQg7iOUvY
         NjfQ==
X-Gm-Message-State: AC+VfDzkEy3QRYnnhAKDZwsK7IRam9BcNu7kpjMA9BM07bFp5s4/dkSu
	WHPaEH9pS5DUDpVEeQzeC5OJjAWX+O4+MR9c5JibVDmx+G8hR6VqdjjIiqN5rGBSRGuRLw+eKR6
	Tc5rZ0KLpFv7cnAjRG544NnaXswD7hUt/YD93mJo3a2OA7Gs+FQ==
X-Received: by 2002:a2e:9b50:0:b0:2b6:9001:e447 with SMTP id o16-20020a2e9b50000000b002b69001e447mr4450711ljj.0.1687856677835;
        Tue, 27 Jun 2023 02:04:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ44fuVorst/+4HibQpjhh2JGJ2tjugiIK+lDXqIbujUWtFVj/hsQjsFDVUMeEGJ4oHuTZBXm8aiLi/qh1jvVFE=
X-Received: by 2002:a2e:9b50:0:b0:2b6:9001:e447 with SMTP id
 o16-20020a2e9b50000000b002b69001e447mr4450692ljj.0.1687856677290; Tue, 27 Jun
 2023 02:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230626072551.1709389-1-pizhenwei@bytedance.com> <20230626072551.1709389-5-pizhenwei@bytedance.com>
In-Reply-To: <20230626072551.1709389-5-pizhenwei@bytedance.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 27 Jun 2023 17:04:25 +0800
Message-ID: <CACGkMEuNbKa8CJAKeB+ATeC9h=6aJ04U1Ti2k6SMde8Giiq8+w@mail.gmail.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: stefanha@redhat.com, parav@nvidia.com, mst@redhat.com, 
	virtio-comment@lists.oasis-open.org, houp@yusur.tech, 
	helei.sig11@bytedance.com, zhouhuaping.san@bytedance.com, 
	xinhao.kong@duke.edu, Zhu Lingshan <lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH v4 4/7] transport-fabrics: introduce command set

On Mon, Jun 26, 2023 at 3:28=E2=80=AFPM zhenwei pi <pizhenwei@bytedance.com=
> wrote:
>
> Introduce command set for Virtio-oF which includes:
> - command id: a tag to distinguish in-flight commands
> - status: indicate the result of a Virtio-oF command
> - opcodes: the Virtio-oF transport layer commands use 0x0000-0x0fff,
>           and the device layer commands use 0x1000-0xffff.
>           get/set status/feature/ config use consecutive number.
>
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> ---
>  transport-fabrics.tex | 616 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 616 insertions(+)
>
> diff --git a/transport-fabrics.tex b/transport-fabrics.tex
> index d562b2c..3fd9e8e 100644
> --- a/transport-fabrics.tex
> +++ b/transport-fabrics.tex
> @@ -113,3 +113,619 @@ \subsubsection{Keyed Data Transfers}\label{sec:Virt=
io Transport Options / Virtio
>       |COMP|     |COMP|     |COMP|
>       +----+     +----+     +----+
>  \end{lstlisting}
> +
> +
> +\subsection{Commands Definition}\label{sec:Virtio Transport Options / Vi=
rtio Over Fabrics / Commands Definition}
> +This section defines data structures, opcodes, and status for Virtio-oF.
> +A Virtio-oF command is fixed to 16 bytes, and a Virtio-oF completion is =
fixed to 16 bytes.
> +Note that the reserved fields of Virtio-oF commands and completions are =
filled with zero.
> +
> +\subsubsection{Command ID}\label{sec:Virtio Transport Options / Virtio O=
ver Fabrics / Commands Definition / Command ID}
> +The Command ID (le16 type) is used to uniquely describe a Virtio-oF PDU =
for identification.
> +Generally, the Virtio-oF initiator allocates a Command ID that is unique=
 for all in-flight commands,
> +and the Virtio-oF target specifies the same Command ID for completion.
> +
> +Command IDs 0xff00 - 0xffff are reserved for the Virtio-oF control queue=
 asynchronous events.
> +The reserved Command IDs for the Virtio-oF control queue are as follows:
> +
> +\begin{tabular}{ |l|l| }
> +\hline
> +Command ID & Description \\
> +\hline \hline
> +0xfffe & Config change. Causes the initiator to generate a configuration=
 change notification \\
> +\hline
> +0xffff & Keepalive. The initiator ignores this event \\
> +\hline
> +0xff00 - 0xfffd & Reserved \\
> +\hline
> +\end{tabular}
> +
> +\subsubsection{Status}\label{sec:Virtio Transport Options / Virtio Over =
Fabrics / Commands Definition / Status}
> +The Status (le16 type) of a Virtio-oF completion is used to indicate the=
 result of a Virtio-oF command in detail.
> +The status values are defined as follows:
> +
> +\begin{lstlisting}
> +/* command executed successfully */
> +#define VIRTIO_OF_STATUS_SUCCESS       0x0000
> +
> +/* unrecognized command, or disabled command due to unsupported feature =
*/
> +#define VIRTIO_OF_STATUS_ENOCMD        0x0001
> +/* in-flight commands exceeded queue size */
> +#define VIRTIO_OF_STATUS_ECMDQUOT      0x0002
> +
> +/* no such target specified by TVQN */
> +#define VIRTIO_OF_STATUS_ENOTGT        0x1001
> +/* failed to create Virtio-oF device instance */
> +#define VIRTIO_OF_STATUS_ENODEV        0x1002
> +/* rejected due to access control */
> +#define VIRTIO_OF_STATUS_EACLREJECTED  0x1003
> +/* bad Virtio-oF device instance ID */
> +#define VIRTIO_OF_STATUS_EBADDEV       0x1010
> +/* mismatched TVQN or IVQN from Virtio-oF device instance */
> +#define VIRTIO_OF_STATUS_EBADVQN       0x1011
> +/* Virtio-oF virtqueue index exceeded */
> +#define VIRTIO_OF_STATUS_EQUEUEQUOT    0x1020
> +/* Virtio-oF virtqueue size exceeded */
> +#define VIRTIO_OF_STATUS_EQSIZEQUOT    0x1021
> +
> +/* unsupported Virtio-oF feature */
> +#define VIRTIO_OF_STATUS_EFEATURE      0x2000
> +/* unsupported Virtio-oF device instance status */
> +#define VIRTIO_OF_STATUS_ESTATUS       0x2010
> +/* unsupported Virtio-oF device instance feature */
> +#define VIRTIO_OF_STATUS_EDEVFEATURE   0x2020
> +/* unsupported offset of device configuration space */
> +#define VIRTIO_OF_STATUS_ECONFOFF      0x2030
> +/* unsupported bytes of device configuration space */
> +#define VIRTIO_OF_STATUS_ECONFBYTES    0x2031
> +/* failed to read device-readable virtqueue buffers */
> +#define VIRTIO_OF_STATUS_EOUTVQBUF     0x20f0
> +/* failed to write device-writable virtqueue buffers */
> +#define VIRTIO_OF_STATUS_EINVQBUF      0x20f1
> +\end{lstlisting}
> +
> +\subsubsection{Opcodes}\label{sec:Virtio Transport Options / Virtio Over=
 Fabrics / Commands Definition / Opcodes}
> +Opcodes (u16 type) of Virtio-oF Commands are as follows:
> +
> +\begin{lstlisting}
> +#define virtio_of_op_connect               0x0000
> +#define virtio_of_op_disconnect            0x0001
> +#define virtio_of_op_keepalive             0x0002
> +#define virtio_of_op_get_feature           0x0004
> +#define virtio_of_op_set_feature           0x0005
> +#define virtio_of_op_get_keyed_num_descs   0x0100
> +#define virtio_of_op_vq                    0x0fff
> +#define virtio_of_op_get_vendor_id         0x1000
> +#define virtio_of_op_get_device_id         0x1001
> +#define virtio_of_op_reset_device          0x1003
> +#define virtio_of_op_get_status            0x1004
> +#define virtio_of_op_set_status            0x1005
> +#define virtio_of_op_get_device_feature    0x1006
> +#define virtio_of_op_set_driver_feature    0x1009
> +#define virtio_of_op_get_vq_size           0x100a
> +#define virtio_of_op_get_config            0x100c
> +#define virtio_of_op_set_config            0x100d

We had a proposal of transport virtqueue that allows using a
virtqueue[1] for configuring a device. And Ling shan will rebase it on
top of the admin commands.

That is to say, admin commands could be used for transport which will
be duplicated with the commands you invented here.

I wonder if the virtio-OF can just reuse the admin commands (have a
quick glance and I didn't find any blocker for this).

Thanks

[1] https://lists.oasis-open.org/archives/virtio-comment/202208/msg00003.ht=
ml

> +\end{lstlisting}
> +
> +\paragraph{Connect Command}\label{sec:Virtio Transport Options / Virtio =
Over Fabrics / Commands Definition / Opcodes / Connect Command}
> +
> +The Connect Command is used to establish a Virtio-oF queue for both the =
Virtio-oF control queue and Virtio-oF virtqueue, it is always the first com=
mand to execute on a Virtio-oF queue.
> +
> +The structure of the Connect Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_connect {
> +        /* opcode is virtio_of_op_connect */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        /* Virtio-oF device instance ID. 0xffff is reserved for the Virt=
io-oF control queue */
> +        le16 device_instance_id;
> +        /* used by Virtio-oF virtqueue only, equal to virtqueue index */
> +        le16 vq_index;
> +        /* the length of the Connect Body */
> +        le32 length;
> +#define VIRTIO_OF_CONTROL_QUEUE_SIZE 32
> +        /* the size of a Virtio-oF queue, 0 means the maximum queue size=
 supported */
> +        le16 queue_size;
> +        u8 reserved[2];
> +};
> +\end{lstlisting}
> +
> +The structure of the Connect Body is as follows:
> +\begin{lstlisting}
> +struct virtio_of_connect {
> +        /* Virtio-oF initiator VQN */
> +        u8 ivqn[256];
> +        /* Virtio-oF target VQN */
> +        u8 tvqn[256];
> +        u8 reserved[512];
> +};
> +\end{lstlisting}
> +
> +The structure of the Connect Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_connect {
> +        le16 status;
> +        le16 command_id;
> +        /* Virtio-oF device instance ID */
> +        le16 device_instance_id;
> +        u8 reserved[10];
> +};
> +\end{lstlisting}
> +
> +The Connect Command, Body, and Completion have the following usages:
> +\begin{itemize}
> +\item The Virtio-oF initiator specifies \texttt{device_instance_id} of 0=
xffff in the Connect command
> +and Virtio-oF initiator/target VQN in the Connect Body to establish the =
Virtio-oF control queue first.
> +\item The Virtio-oF target allocates any available ID for a newly create=
d Virtio-oF device instance,
> +and specifies the \texttt{device_instance_id} of the new Virtio-oF devic=
e instance ID in the Connect Completion.
> +\item The Virtio-oF initiator specifies the Virtio-oF device instance ID=
 and \texttt{vq_index} to establish Virtio-oF virtqueues one by one.
> +The Connect Body is optional for the Virtio-oF virtqueues, once a Virtio=
-oF virtqueue issues a Connect Command without Connect Body, the Virtio-oF =
virtqueue uses the same Connect Body as the Virtio-oF control queue.
> +\end{itemize}
> +
> +\paragraph{Disconnect Command}\label{sec:Virtio Transport Options / Virt=
io Over Fabrics / Commands Definition / Opcodes / Disconnect Command}
> +
> +The Disconnect Command is used to gracefully disconnect both the Virtio-=
oF control queue and Virtio-oF virtqueue. All in-flight commands are comple=
ted upon receipt of the Disconnect Completion.
> +
> +The structure of the Disconnect Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_disconnect {
> +        /* opcode is virtio_of_op_disconnect */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        u8 reserved[12];
> +};
> +\end{lstlisting}
> +
> +The structure of the Disconnect Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_disconnect {
> +        le16 status;
> +        le16 command_id;
> +        u8 reserved[12];
> +};
> +\end{lstlisting}
> +
> +The Disconnect Command and Completion have the following usages:
> +\begin{itemize}
> +\item The Virtio-oF initiator should disconnect the Virtio-oF virtqueues=
 before the Virtio-oF control queue.
> +\item Once the Virtio-oF control queue is disconnected, the Virtio-oF de=
vice instance and associated resources should be destroyed.
> +\item If the underlying transport connection of a Virtio-oF queue is dis=
connected without issuing the Disconnect Command, the in-flight commands ar=
e not guaranteed to execute successfully.
> +\end{itemize}
> +
> +\paragraph{Keepalive Command}\label{sec:Virtio Transport Options / Virti=
o Over Fabrics / Commands Definition / Opcodes / Keepalive Command}
> +The Keepalive Command is used as a health check mechanism to detect when=
 a Virtio-oF device instance becomes unavailable, it is used for the Virtio=
-oF control queue only.
> +Once the Virtio-oF device instance becomes unavailable, the initiator sh=
ould disconnect all the Virtio-oF queues and release associated resources.
> +
> +The structure of the Keepalive Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_keepalive {
> +        /* opcode is virtio_of_op_keepalive */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        u8 reserved[12];
> +};
> +\end{lstlisting}
> +
> +The structure of the Keepalive Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_keepalive {
> +        le16 status;
> +        le16 command_id;
> +        u8 reserved[12];
> +};
> +\end{lstlisting}
> +
> +\paragraph{Get Feature Command}\label{sec:Virtio Transport Options / Vir=
tio Over Fabrics / Commands Definition / Opcodes / Get Feature Command}
> +The Get Feature Command is used to get feature bits of a Virtio-oF devic=
e instance for the Virtio-oF control queue only.
> +
> +The structure of the Get Feature Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_get_feature {
> +        /* opcode is virtio_of_op_get_feature */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        /* value 0x0 selects feature bits 0 to 63, 0x1 selects feature b=
its 64 to 127, etc */
> +        le32 feature_select;
> +        u8 reserved[8];
> +};
> +\end{lstlisting}
> +
> +The structure of the Get Feature Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_get_feature {
> +        le16 status;
> +        le16 command_id;
> +        u8 reserved[4];
> +        /* feature bits */
> +        le64 feature;
> +};
> +\end{lstlisting}
> +
> +The feature bits of a Virtio-oF device instance are as follows:
> +\begin{lstlisting}
> +/* support virtio_of_op_get_keyed_num_descs to get the maximum number of=
 keyed descriptors */
> +#define VIRTIO_OF_F_KEYED_NUM_DESCS            0
> +\end{lstlisting}
> +
> +\paragraph{Set Feature Command}\label{sec:Virtio Transport Options / Vir=
tio Over Fabrics / Commands Definition / Opcodes / Set Feature Command}
> +The Set Feature Command is used to set the feature bits of a Virtio-oF d=
evice instance for the Virtio-oF control queue only.
> +
> +The structure of the Set Feature Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_set_feature {
> +        /* opcode is virtio_of_op_set_feature */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        /* value 0x0 selects feature bits 0 to 63, 0x1 selects feature b=
its 64 to 127, etc */
> +        le32 feature_select;
> +        /* feature bits */
> +        le64 feature;
> +};
> +\end{lstlisting}
> +
> +The structure of the Set Feature Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_set_feature {
> +        le16 status;
> +        le16 command_id;
> +        u8 reserved[12];
> +};
> +\end{lstlisting}
> +
> +Note: it is recommended that the
> +\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Commands D=
efinition / Opcodes / Get Feature Command}
> +and Set Feature Command should be executed upon the establishment of the=
 Virtio-oF control queue for feature negotiation.
> +However, they are allowed to be executed during the Virtio-oF control qu=
eue lifecycle.
> +
> +\paragraph{Get Keyed Number Descriptors Command}\label{sec:Virtio Transp=
ort Options / Virtio Over Fabrics / Commands Definition / Opcodes / Get Key=
ed Number Descriptors Command}
> +The Get Keyed Number Descriptors Command is used to get the maximum numb=
er of keyed descriptors of Virtio-oF virtqueues, it is executed on the Virt=
io-oF control queue.
> +
> +The structure of the Get Keyed Number Descriptors Command structure is a=
s follows:
> +\begin{lstlisting}
> +struct virtio_of_command_get_keyed_num_descs {
> +        /* opcode is virtio_of_op_get_keyed_num_descs */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        u8 reserved[12];
> +};
> +\end{lstlisting}
> +
> +The structure of the Get Keyed Number Descriptors Completion is as follo=
ws:
> +\begin{lstlisting}
> +struct virtio_of_completion_get_keyed_num_descs {
> +        le16 status;
> +        le16 command_id;
> +        /* the maximum number of keyed descriptors */
> +        u8 descs;
> +        u8 reserved[11];
> +};
> +\end{lstlisting}
> +
> +\paragraph{VQ Command}\label{sec:Virtio Transport Options / Virtio Over =
Fabrics / Commands Definition / Opcodes / VQ Command}
> +The VQ Command is used to transmit virtqueue buffers for Virtio-oF virtq=
ueue only.
> +
> +The structure of the VQ Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_vq {
> +        /* opcode is virtio_of_op_vq */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        u8 reserved[4];
> +        /* the length of device-readable virtqueue buffers */
> +        le32 out_length;
> +        /* the length of device-writable virtqueue buffers */
> +        le32 in_length;
> +};
> +\end{lstlisting}
> +
> +The structure of the VQ Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_vq {
> +        le16 status;
> +        le16 command_id;
> +        /* the length of virtqueue buffers from Virtio-oF target */
> +        le32 length;
> +        u8 reserved[8];
> +};
> +\end{lstlisting}
> +
> +For \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Protoc=
ol Data Unit/ Stream Data Transfers},
> +\texttt{out_length} of virtio_of_command_vq describes the following byte=
s in a request Virtio-oF PDU,
> +and \texttt{length} of virtio_of_completion_vq describes the following b=
ytes in a response Virtio-oF PDU.
> +
> +For \nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Protoc=
ol Data Unit/ Keyed Data Transfers},
> +there are 1 or more keyed descriptors (virtio_of_keyed_desc type) in a r=
equest Virtio-oF PDU to describe the virtqueue buffers of \texttt{out_lengt=
h + in_length} bytes,
> +and \texttt{length} of virtio_of_completion_vq describes the number of b=
ytes written into the device writable portion of the buffer described by th=
e keyed descriptors.
> +
> +\paragraph{Get Vendor ID Command}\label{sec:Virtio Transport Options / V=
irtio Over Fabrics / Commands Definition / Opcodes / Get Vendor ID Command}
> +The Get Vendor ID Command is used to get the Virtio Vendor ID of a Virti=
o-oF device instance for the Virtio-oF control queue only.
> +
> +The structure of the Get Vendor ID Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_get_vendor_id {
> +        /* opcode is virtio_of_op_get_vendor_id */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        u8 reserved[12];
> +};
> +\end{lstlisting}
> +
> +The structure of the Get Vendor ID Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_get_vendor_id {
> +        le16 status;
> +        le16 command_id;
> +        /* Virtio Vendor ID */
> +        le32 vendor_id;
> +        u8 reserved[8];
> +};
> +\end{lstlisting}
> +
> +\paragraph{Get Device ID Command}\label{sec:Virtio Transport Options / V=
irtio Over Fabrics / Commands Definition / Opcodes / Get Device ID Command}
> +The Get Device ID Command is used to get the Virtio Device ID of a Virti=
o-oF device instance for the Virtio-oF control queue only.
> +
> +The structure of the Get Device ID Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_get_device_id {
> +        /* opcode is virtio_of_op_get_device_id */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        u8 reserved[12];
> +};
> +\end{lstlisting}
> +
> +The structure of the Get Device ID Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_get_device_id {
> +        le16 status;
> +        le16 command_id;
> +        /* Virtio Device ID */
> +        le32 device_id;
> +        u8 reserved[8];
> +};
> +\end{lstlisting}
> +
> +\paragraph{Reset Device Command}\label{sec:Virtio Transport Options / Vi=
rtio Over Fabrics / Commands Definition / Opcodes / Reset Device Command}
> +The Reset Device Command is used to reset a Virtio-oF device instance fo=
r the Virtio-oF control queue only.
> +
> +The structure of the Reset Device Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_reset_device {
> +        /* opcode is virtio_of_op_get_device_id */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        u8 reserved[12];
> +};
> +\end{lstlisting}
> +
> +The structure of the Reset Device Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_reset_device {
> +        le16 status;
> +        le16 command_id;
> +        u8 reserved[12];
> +};
> +\end{lstlisting}
> +
> +\paragraph{Get Status Command}\label{sec:Virtio Transport Options / Virt=
io Over Fabrics / Commands Definition / Opcodes / Get Status Command}
> +The Get Status Command is used to get the status of a Virtio-oF device i=
nstance for the Virtio-oF control queue only.
> +
> +The structure of the Get Status Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_get_status {
> +        /* opcode is virtio_of_op_get_status */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        u8 reserved[12];
> +};
> +\end{lstlisting}
> +
> +The structure of the Get Status Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_get_status {
> +        le16 status;
> +        le16 command_id;
> +        /* status of the Virtio-oF device instance */
> +        le32 dev_status;
> +        u8 reserved[8];
> +};
> +\end{lstlisting}
> +
> +\paragraph{Set Status Command}\label{sec:Virtio Transport Options / Virt=
io Over Fabrics / Commands Definition / Opcodes / Set Status Command}
> +The Set Status Command is used to set the status of a Virtio-oF device i=
nstance for the Virtio-oF control queue only.
> +
> +The structure of the Set Status Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_set_status {
> +        /* opcode is virtio_of_op_set_status */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        /* status of the Virtio-oF device instance */
> +        le32 status;
> +        u8 reserved[8];
> +};
> +\end{lstlisting}
> +
> +The structure of the Set Status Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_set_status {
> +        le16 status;
> +        le16 command_id;
> +        u8 reserved[12];
> +};
> +\end{lstlisting}
> +
> +\paragraph{Get Device Feature Command}\label{sec:Virtio Transport Option=
s / Virtio Over Fabrics / Commands Definition / Opcodes / Get Device Featur=
e Command}
> +The Get Device Feature Command is used to get virtio device feature bits=
 of a Virtio-oF device instance for the Virtio-oF control queue only.
> +
> +The structure of the Get Device Feature Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_get_device_feature {
> +        /* opcode is virtio_of_op_get_device_feature */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        /* value 0x0 selects feature bits 0 to 63, 0x1 selects feature b=
its 64 to 127, etc */
> +        le32 feature_select;
> +        u8 reserved[8];
> +};
> +\end{lstlisting}
> +
> +The structure of the Get Device Feature Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_get_device_feature {
> +        le16 status;
> +        le16 command_id;
> +        u8 reserved[4];
> +        /* feature bits */
> +        le64 feature;
> +};
> +\end{lstlisting}
> +
> +\paragraph{Set Driver Feature Command}\label{sec:Virtio Transport Option=
s / Virtio Over Fabrics / Commands Definition / Opcodes / Set Driver Featur=
e Command}
> +The Set Driver Feature Command is used to set virtio driver feature bits=
 of a Virtio-oF device instance for the Virtio-oF control queue only.
> +
> +The structure of the Set Driver Feature Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_set_driver_feature {
> +        /* opcode is virtio_of_op_set_driver_feature */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        /* value 0x0 selects feature bits 0 to 63, 0x1 selects feature b=
its 64 to 127, etc */
> +        le32 feature_select;
> +        /* feature bits */
> +        le64 feature;
> +};
> +\end{lstlisting}
> +
> +The structure of the Set Driver Feature Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_set_driver_feature {
> +        le16 status;
> +        le16 command_id;
> +        u8 reserved[12];
> +};
> +\end{lstlisting}
> +
> +\paragraph{Get VQ Size Command}\label{sec:Virtio Transport Options / Vir=
tio Over Fabrics / Commands Definition / Opcodes / Get VQ Size Command}
> +The Get VQ Size Command is used to get the maximum queue size of a Virti=
o-oF virtqueue for the Virtio-oF control queue only.
> +
> +The structure of the Get VQ Size Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_get_vq_size {
> +        /* opcode is virtio_of_op_get_vq_size */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        /* the Virtio-oF virtqueue index */
> +        le16 vq_index;
> +        u8 reserved[10];
> +};
> +\end{lstlisting}
> +
> +The structure of the Get VQ Size Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_get_vq_size {
> +        le16 status;
> +        le16 command_id;
> +        /* size of Virtio-oF virtqueues */
> +        le16 size;
> +        u8 reserved[10];
> +};
> +\end{lstlisting}
> +
> +Note: the Virtio-oF control queue has a fixed queue size, the Virtio-oF =
initiator can specify a smaller Virtio-oF virtqueue size by
> +\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Commands D=
efinition / Opcodes / Connect Command}.
> +
> +\paragraph{Get Config Command}\label{sec:Virtio Transport Options / Virt=
io Over Fabrics / Commands Definition / Opcodes / Get Config Command}
> +The Get Config Command is used to get the device configuration space of =
a Virtio-oF device instance for the Virtio-oF control queue only.
> +
> +The structure of the Get Config Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_get_config {
> +        /* opcode is virtio_of_op_get_config */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        /* offset of device configuration space */
> +        le16 offset;
> +        /* bytes to get, available values: 1, 2, 4, 8 */
> +        u8 bytes;
> +        u8 reserved[9];
> +};
> +\end{lstlisting}
> +
> +The structure of the Get Config Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_get_config {
> +        le16 status;
> +        le16 command_id;
> +        /* generation count for the device configuration space */
> +        le32 generation;
> +        /* v is u8, u16, u32, or u64, then: v =3D (typeof v)le64_to_cpu(=
config) */
> +        le64 config;
> +};
> +\end{lstlisting}
> +
> +\paragraph{Set Config Command}\label{sec:Virtio Transport Options / Virt=
io Over Fabrics / Commands Definition / Opcodes / Set Config Command}
> +The Set Config Command is used to set the device configuration space of =
a Virtio-oF device instance for the Virtio-oF control queue only.
> +
> +The structure of the Set Config Command structure is as follows:
> +\begin{lstlisting}
> +struct virtio_of_command_set_config {
> +        /* opcode is virtio_of_op_set_config */
> +        le16 opcode;
> +        /* unique ID for all in-flight commands */
> +        le16 command_id;
> +        /* offset of device configuration space */
> +        le16 offset;
> +        /* bytes to get, available values: 1, 2, 4, 8 */
> +        u8 bytes;
> +        u8 reserved;
> +        /* v is u8, u16, u32, or u64, then: config =3D cpu_to_le64((u64)=
v) */
> +        le64 config;
> +};
> +\end{lstlisting}
> +
> +The structure of the Set Config Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_set_config {
> +        le16 status;
> +        le16 command_id;
> +        u8 reserved[12];
> +};
> +\end{lstlisting}
> +
> +\paragraph{Config Change Completion}\label{sec:Virtio Transport Options =
/ Virtio Over Fabrics / Commands Definition / Opcodes / Config Change Compl=
etion}
> +A Config Change Completion is used as a configuration change notificatio=
n of a Virtio-oF device instance for the Virtio-oF control queue only.
> +Note: only a single outstanding Config Change Completion is allowed, the=
 configuration change notification is suppressed until the Virtio-oF initia=
tor issues a
> +\nameref{sec:Virtio Transport Options / Virtio Over Fabrics / Commands D=
efinition / Opcodes / Get Config Command}.
> +
> +The structure of the Config Change Completion is as follows:
> +\begin{lstlisting}
> +struct virtio_of_completion_config_change {
> +        le16 status;
> +        /* command_id is 0xfffe */
> +        le16 command_id;
> +        /*  generation count for the device configuration space */
> +        le32 generation;
> +        u8 reserved[8];
> +};
> +\end{lstlisting}
> +
> +\paragraph{Keepalive Completion}\label{sec:Virtio Transport Options / Vi=
rtio Over Fabrics / Commands Definition / Opcodes / Keepalive Completion}
> +A Keepalive Completion is used as a health check mechanism to detect whe=
n a Virtio-oF initiator becomes unavailable, it is used by a Virtio-oF devi=
ce instance for the Virtio-oF control queue only.
> +Once the Virtio-oF initiator becomes unavailable, the Virtio-oF target s=
hould destroy the Virtio-oF device instance and associated resources.
> --
> 2.25.1
>


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

