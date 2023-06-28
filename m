Return-Path: <virtio-comment-return-6560-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3500EEB64DC
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Jun 2023 02:56:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7C3B7C8DE5
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Jun 2023 02:56:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 664A998656E
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Jun 2023 02:56:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 510BC986317; Wed, 28 Jun 2023 02:56:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3BCE798654C
	for <virtio-comment@lists.oasis-open.org>; Wed, 28 Jun 2023 02:56:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 4JOG2mVANe-HFjQ5fkvdSg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687920985; x=1690512985;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+RO/yQM4N7xwFxT5ruNFVzko91/4b0vntNikYuQHS4=;
        b=jDTDIXAI30MebhtpaBfRqO3unujZlfub4RN2+8rf0be1nEuYy1ldvk2DlkPGAbrhiO
         m/VwF5SAvYUQPm/eN2WUuQrdsGA4cGs3sBd4T5+kv1Dahin3J7Z6wI/v/6OxaKSfjHh1
         XYHwO9cKMnLlp4MhMz6uf0R1mTxVptpIqZvloB8lw+Hpqj8GN8WnwxKhxsZLotpneKeJ
         +Q+nRl6Ai3C9HYVJq8LccxGSlKFEgYT2/OUtSfr4/uiDYcYjXTjVMLo+FGsB331jRo0k
         Q8OJ4cQv76YjSSShFJ/0TkqGZTAhioiJhn9XfTxd3C958XNZf07t5xO8sHLIHX3iVSin
         MRQw==
X-Gm-Message-State: AC+VfDycwZxcA+aumQPugOxGFfveGUPfiUtQ+YYzCskJQ7FpP1gnwqAC
	vTTmXKXkTz+LAS4AzSeAc2RTuY4dnEwwIi1nujIF4vBS3j2degWAT55+6or4tFgGozg9Fmo75/J
	CdDUW34vxEKleUodVJWyb54kFTYYDvuw2J5VDymVES3aFfcstpQ==
X-Received: by 2002:a2e:b34b:0:b0:2b5:9778:7cd6 with SMTP id q11-20020a2eb34b000000b002b597787cd6mr8659084lja.49.1687920984986;
        Tue, 27 Jun 2023 19:56:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6NM+beNFDXiTa/7frKQMl4lMCnhXOnitm2INdk2kMkLtoUOM8aVa/BNt4CjPUoiGyL6l8ZiYMbDpvDp/DN2yY=
X-Received: by 2002:a2e:b34b:0:b0:2b5:9778:7cd6 with SMTP id
 q11-20020a2eb34b000000b002b597787cd6mr8659070lja.49.1687920984625; Tue, 27
 Jun 2023 19:56:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230626072551.1709389-1-pizhenwei@bytedance.com>
 <20230626072551.1709389-5-pizhenwei@bytedance.com> <CACGkMEuNbKa8CJAKeB+ATeC9h=6aJ04U1Ti2k6SMde8Giiq8+w@mail.gmail.com>
 <ebf95d17-36e2-9e46-cb03-459c12f75a87@bytedance.com>
In-Reply-To: <ebf95d17-36e2-9e46-cb03-459c12f75a87@bytedance.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 28 Jun 2023 10:56:13 +0800
Message-ID: <CACGkMEthPiw5XK7ADWNefRPBzhqFBNxnOvZjCNJsooj99C4-DA@mail.gmail.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: stefanha@redhat.com, parav@nvidia.com, mst@redhat.com, 
	virtio-comment@lists.oasis-open.org, houp@yusur.tech, 
	helei.sig11@bytedance.com, zhouhuaping.san@bytedance.com, 
	xinhao.kong@duke.edu, Zhu Lingshan <lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: Re: [PATCH v4 4/7] transport-fabrics: introduce command set

On Wed, Jun 28, 2023 at 9:37=E2=80=AFAM zhenwei pi <pizhenwei@bytedance.com=
> wrote:
>
>
>
> On 6/27/23 17:04, Jason Wang wrote:
> > On Mon, Jun 26, 2023 at 3:28=E2=80=AFPM zhenwei pi <pizhenwei@bytedance=
.com> wrote:
> >>
> >> Introduce command set for Virtio-oF which includes:
> >> - command id: a tag to distinguish in-flight commands
> >> - status: indicate the result of a Virtio-oF command
> >> - opcodes: the Virtio-oF transport layer commands use 0x0000-0x0fff,
> >>            and the device layer commands use 0x1000-0xffff.
> >>            get/set status/feature/ config use consecutive number.
> >>
> >> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> >> ---
> >>   transport-fabrics.tex | 616 ++++++++++++++++++++++++++++++++++++++++=
++
> >>   1 file changed, 616 insertions(+)
> >>
> >> diff --git a/transport-fabrics.tex b/transport-fabrics.tex
> >> index d562b2c..3fd9e8e 100644
> >> --- a/transport-fabrics.tex
> >> +++ b/transport-fabrics.tex
> >> @@ -113,3 +113,619 @@ \subsubsection{Keyed Data Transfers}\label{sec:V=
irtio Transport Options / Virtio
> >>        |COMP|     |COMP|     |COMP|
> >>        +----+     +----+     +----+
> >>   \end{lstlisting}
> >> +
> >> +
> >> +\subsection{Commands Definition}\label{sec:Virtio Transport Options /=
 Virtio Over Fabrics / Commands Definition}
> >> +This section defines data structures, opcodes, and status for Virtio-=
oF.
> >> +A Virtio-oF command is fixed to 16 bytes, and a Virtio-oF completion =
is fixed to 16 bytes.
> >> +Note that the reserved fields of Virtio-oF commands and completions a=
re filled with zero.
> >> +
> >> +\subsubsection{Command ID}\label{sec:Virtio Transport Options / Virti=
o Over Fabrics / Commands Definition / Command ID}
> >> +The Command ID (le16 type) is used to uniquely describe a Virtio-oF P=
DU for identification.
> >> +Generally, the Virtio-oF initiator allocates a Command ID that is uni=
que for all in-flight commands,
> >> +and the Virtio-oF target specifies the same Command ID for completion=
.
> >> +
> >> +Command IDs 0xff00 - 0xffff are reserved for the Virtio-oF control qu=
eue asynchronous events.
> >> +The reserved Command IDs for the Virtio-oF control queue are as follo=
ws:
> >> +
> >> +\begin{tabular}{ |l|l| }
> >> +\hline
> >> +Command ID & Description \\
> >> +\hline \hline
> >> +0xfffe & Config change. Causes the initiator to generate a configurat=
ion change notification \\
> >> +\hline
> >> +0xffff & Keepalive. The initiator ignores this event \\
> >> +\hline
> >> +0xff00 - 0xfffd & Reserved \\
> >> +\hline
> >> +\end{tabular}
> >> +
> >> +\subsubsection{Status}\label{sec:Virtio Transport Options / Virtio Ov=
er Fabrics / Commands Definition / Status}
> >> +The Status (le16 type) of a Virtio-oF completion is used to indicate =
the result of a Virtio-oF command in detail.
> >> +The status values are defined as follows:
> >> +
> >> +\begin{lstlisting}
> >> +/* command executed successfully */
> >> +#define VIRTIO_OF_STATUS_SUCCESS       0x0000
> >> +
> >> +/* unrecognized command, or disabled command due to unsupported featu=
re */
> >> +#define VIRTIO_OF_STATUS_ENOCMD        0x0001
> >> +/* in-flight commands exceeded queue size */
> >> +#define VIRTIO_OF_STATUS_ECMDQUOT      0x0002
> >> +
> >> +/* no such target specified by TVQN */
> >> +#define VIRTIO_OF_STATUS_ENOTGT        0x1001
> >> +/* failed to create Virtio-oF device instance */
> >> +#define VIRTIO_OF_STATUS_ENODEV        0x1002
> >> +/* rejected due to access control */
> >> +#define VIRTIO_OF_STATUS_EACLREJECTED  0x1003
> >> +/* bad Virtio-oF device instance ID */
> >> +#define VIRTIO_OF_STATUS_EBADDEV       0x1010
> >> +/* mismatched TVQN or IVQN from Virtio-oF device instance */
> >> +#define VIRTIO_OF_STATUS_EBADVQN       0x1011
> >> +/* Virtio-oF virtqueue index exceeded */
> >> +#define VIRTIO_OF_STATUS_EQUEUEQUOT    0x1020
> >> +/* Virtio-oF virtqueue size exceeded */
> >> +#define VIRTIO_OF_STATUS_EQSIZEQUOT    0x1021
> >> +
> >> +/* unsupported Virtio-oF feature */
> >> +#define VIRTIO_OF_STATUS_EFEATURE      0x2000
> >> +/* unsupported Virtio-oF device instance status */
> >> +#define VIRTIO_OF_STATUS_ESTATUS       0x2010
> >> +/* unsupported Virtio-oF device instance feature */
> >> +#define VIRTIO_OF_STATUS_EDEVFEATURE   0x2020
> >> +/* unsupported offset of device configuration space */
> >> +#define VIRTIO_OF_STATUS_ECONFOFF      0x2030
> >> +/* unsupported bytes of device configuration space */
> >> +#define VIRTIO_OF_STATUS_ECONFBYTES    0x2031
> >> +/* failed to read device-readable virtqueue buffers */
> >> +#define VIRTIO_OF_STATUS_EOUTVQBUF     0x20f0
> >> +/* failed to write device-writable virtqueue buffers */
> >> +#define VIRTIO_OF_STATUS_EINVQBUF      0x20f1
> >> +\end{lstlisting}
> >> +
> >> +\subsubsection{Opcodes}\label{sec:Virtio Transport Options / Virtio O=
ver Fabrics / Commands Definition / Opcodes}
> >> +Opcodes (u16 type) of Virtio-oF Commands are as follows:
> >> +
> >> +\begin{lstlisting}
> >> +#define virtio_of_op_connect               0x0000
> >> +#define virtio_of_op_disconnect            0x0001
> >> +#define virtio_of_op_keepalive             0x0002
> >> +#define virtio_of_op_get_feature           0x0004
> >> +#define virtio_of_op_set_feature           0x0005
> >> +#define virtio_of_op_get_keyed_num_descs   0x0100
> >> +#define virtio_of_op_vq                    0x0fff
> >> +#define virtio_of_op_get_vendor_id         0x1000
> >> +#define virtio_of_op_get_device_id         0x1001
> >> +#define virtio_of_op_reset_device          0x1003
> >> +#define virtio_of_op_get_status            0x1004
> >> +#define virtio_of_op_set_status            0x1005
> >> +#define virtio_of_op_get_device_feature    0x1006
> >> +#define virtio_of_op_set_driver_feature    0x1009
> >> +#define virtio_of_op_get_vq_size           0x100a
> >> +#define virtio_of_op_get_config            0x100c
> >> +#define virtio_of_op_set_config            0x100d
> >
> > We had a proposal of transport virtqueue that allows using a
> > virtqueue[1] for configuring a device. And Ling shan will rebase it on
> > top of the admin commands.
> >
> > That is to say, admin commands could be used for transport which will
> > be duplicated with the commands you invented here.
> >
> > I wonder if the virtio-OF can just reuse the admin commands (have a
> > quick glance and I didn't find any blocker for this).
> >
> > Thanks
> >
> > [1] https://lists.oasis-open.org/archives/virtio-comment/202208/msg0000=
3.html
> >
>
>  From my understand, the virtio device related commands looks
> similar(set/get status/features, reset device ...), but not same:
> 1, the admin commands are executed upon the admin virtqueue, it uses
> virtqueue based transfer.

Note that the actual commands are independent of admin virtqueue. It
is defined separately as admin commands and it would be supported by
the MMIO in the future.

> The virtio-of commands are executed upon a virtio-of queue(established
> reliable connection), not a virtqueue. A virtio-of device could support
> admin commands in theory.
> I suppose a virtio-of device with admin vq supported like:
> +---------------------+
> |   +-------------+   |
> |   |control queue|   |
> |   +-------------+   |
> +---------------------+
> |   +-------------+   |
> |   | virtqueue0  |   |
> |   +-------------+   |
> |   | virtqueue1  |   |
> |   +-------------+   |
> |   | virtqueue ..|   |
> |   +-------------+   |
> |   |  admin vq   |   |
> |   +-------------+   |
> +---------------------+
>
> The virtio-of commands ares used by both virtio-of control queue and
> virtio-of virtqueues(include admin vq).
> The admin commands are used by admin vq only.
>
> 2, the virtio-of commands are used over fabrics, they are defined in a
> fixed size,

Any issue you see if it is variable?

> the admin commands are described by virtqueue descriptors.

See above, it's not necessarily carried via descriptors.

>
> 3, the virtio-of commands need a command_id field to distinguish each
> other for command depth, but the admin commands don't need command_id
> field(supported by virtqueue descriptor heads).

I'm not sure I get this, could you give me an example?

>
> 4, connect/disconnect are fabrics specific, stream/keyed transfer
> related features/commands are fabrics specific too.
> interrupt related commands are not used by virtio-of.

So we had:

struct virtio_admin_cmd {
        /* Device-readable part */
        le16 opcode;
        /*
         * 1       - SR-IOV
         * 2-65535 - reserved
         */
        le16 group_type;
...
};

The of specific command could have a dedicated group in this case.

Thanks

>
> As far as I can see, they are quite different, defining them separately
> would be fine.
>
> --
> zhenwei pi
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

