Return-Path: <virtio-comment-return-7159-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A94FC0015E
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 18:03:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 900B171C87
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 18:03:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 625E89863D8
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 18:03:37 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4E9B69863A7; Tue, 15 Aug 2023 18:03:37 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3D3199863AC
	for <virtio-comment@lists.oasis-open.org>; Tue, 15 Aug 2023 18:03:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692122614; x=1692727414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o09ToZE7MfLk2u6oFJVB1NyZUE9DiCHDrc34dD4Jcq4=;
        b=R6FZk14JYgRQKlpLIPbTJWBAlEpWiugu7XXDE3A7nS4R65DHTSmTpldXYTXVI2sUWi
         oBae8j1vN6ScQsI4E/hj2ls8RRsorGBtjEvcKjeJe14ErcA/PGpWQPLgZqJKyGFMi+7T
         jlyySMUBwbwYBSxxYzoHPXIZv4HFrMWgQ1ZhstgC8XoXCR+b5LbHYOEoj0+d+DOqcRu3
         vmWYqlC3ZW/bptP6k5CsWMZ52a2juEWsarN4F1TJmPcNjbFkc2w2s/WQPlDt0zJeAND0
         nN5roFrNxufBKaFAWaGUQWWoiBCbPQEl0bd1gOyvliZqHvpTKfWC9AXsgT8EOWEfP7SZ
         bhsA==
X-Gm-Message-State: AOJu0YyhrNlrSLb+ceh6JrGIyAbR9vSMOUZuzkBQhoEVFSUKt1j4VWyA
	DKtDi8fDAafn3T8vKQxPReCfZTeh+n1Svzx7E4yZIQ==
X-Google-Smtp-Source: AGHT+IEPrhcRG8wHM10dbNNJo8DvE1trIcd3CtYZ1Nys/wzbBa8Rw9JCIah+Fj1w8Ri9H+LT7wOgeDlGL5oHDhvJjss=
X-Received: by 2002:a05:6512:1154:b0:4f8:5885:61e with SMTP id
 m20-20020a056512115400b004f85885061emr10911822lfg.40.1692122613989; Tue, 15
 Aug 2023 11:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230815123650.38822-1-hengqi@linux.alibaba.com>
In-Reply-To: <20230815123650.38822-1-hengqi@linux.alibaba.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Tue, 15 Aug 2023 21:03:20 +0300
Message-ID: <CAOEp5OfUDq-6i7i4Ccr3P8=Fi308aUx7zPw9KSKesVnmEWsZwQ@mail.gmail.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: virtio-comment@lists.oasis-open.org, Parav Pandit <parav@nvidia.com>, 
	"Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, xuanzhuo@linux.alibaba.com
Content-Type: multipart/alternative; boundary="00000000000052db800602f9ffb5"
Subject: Re: [virtio-comment] [PATCH] virtio-net: support the RSS context

--00000000000052db800602f9ffb5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Probably worth to clarify: what is the expected persistency of the RSS
context: is it expected to survive device reset? powerdown cycle?
If there is some level of persistency, how can external software know what
contexts that the device contains?
Should the sub-command be defined to apply one of saved contexts?

Thanks,
Yuri


On Tue, Aug 15, 2023 at 3:36=E2=80=AFPM Heng Qi <hengqi@linux.alibaba.com> =
wrote:

> Commit 84a1d9c48200 ("net: ethtool: extend RXNFC API to support RSS
> spreading of
> filter matches") adds support for RSS context as a destination for receiv=
e
> flow filters
> (pls see https://lists.oasis-open.
> org/archives/virtio-comment/202308/msg00194.html).
>
> An RSS context consists of configurable parameters specified by
> receive-side scaling.
>
> Usecase:
> When users want some data flows to be steered to specific multiple rxqs,
> they can set
> receive flow filter rules for these data flows to an RSS context with
> desired rxqs.
>
> How to set/configure an RSS context:
> Assuming no RSS context has been created before.
> 1. ethtool -X eth0 context new start 5 equal 8
>
> This command creates an RSS context with an id=3D1 for eth0, and fills in
> the indirection
> table with rxq indexes 5-8 circularly. The hash key and hash types reuse
> the default
> RSS configuration.
>
> Then, we can use 'ethtool -x eth0 context 1' to query the above
> configuration.
>
> 2. ethtool -X eth0 context new start 6 equal 7 \
>    hkey 8f:bf:dd:11:23:58:d2:8a:00:31:d0:32:a3:b5:1f:\
>
>  1f:e4:d1:fe:47:7f:64:42:fd:d0:61:16:b8:b0:f9:71:e8:2d:36:7f:18:dd:4d:c8:=
f3
>
> This command creates an RSS context with an id=3D2 for eth0, and fills in
> the indirection
> table with rxq indexes 6-7 circularly. The hash key is
> 8f:bf:dd:11:23:58:d2:8a:00:31:d0\
>
> :32:a3:b5:1f:1f:e4:d1:fe:47:7f:64:42:fd:d0:61:16:b8:b0:f9:71:e8:2d:36:7f:=
18:dd:4d:c8:f3.
> Hash types reuse the default RSS configuration.
>
> 3. ethtool -N eth0 rx-flow-hash tcp4 sdfn context 1
>
> This command specifies the hash types for the RSS context whose id=3D1 on
> eth0.
> Now this RSS context only has the hash key to reuse the default RSS
> configuration.
>
> 4. ethtool -N eth0 flow-type udp4 src-ip 1.1.1.1 context 1
>
> This command configures a receive flow filter rule for eth0, and the data
> flow matching
> this rule will continue to select the final rxq according to the RSS
> context configuration
> with id=3D1.
>
> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> ---
>  device-types/net/description.tex        | 70 +++++++++++++++++++++++++
>  device-types/net/driver-conformance.tex |  1 +
>  2 files changed, 71 insertions(+)
>
> diff --git a/device-types/net/description.tex
> b/device-types/net/description.tex
> index 76585b0..2deb060 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -88,6 +88,8 @@ \subsection{Feature bits}\label{sec:Device Types /
> Network Device / Feature bits
>  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control
>      channel.
>
> +\item[VIRTIO_NET_F_RSS_CONTEXT(50)] Device supports multiple RSS context=
s.
> +
>  \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header hash fo=
r
> encapsulated packets.
>
>  \item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtqueue
> notification coalescing.
> @@ -150,6 +152,7 @@ \subsubsection{Feature bit
> requirements}\label{sec:Device Types / Network Device
>  \item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_CTRL_VQ.
>  \item[VIRTIO_NET_F_VQ_NOTF_COAL] Requires VIRTIO_NET_F_CTRL_VQ.
>  \item[VIRTIO_NET_F_HASH_TUNNEL] Requires VIRTIO_NET_F_CTRL_VQ along with
> VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT.
> +\item[VIRTIO_NET_F_RSS_CONTEXT] Requires VIRTIO_NET_F_CTRL_VQ and
> VIRTIO_NET_F_RSS.
>  \end{description}
>
>  \subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types /
> Network Device / Feature bits / Legacy Interface: Feature bits}
> @@ -179,6 +182,8 @@ \subsection{Device configuration
> layout}\label{sec:Device Types / Network Device
>          le16 rss_max_indirection_table_length;
>          le32 supported_hash_types;
>          le32 supported_tunnel_types;
> +        le16 max_rss_contexts;
> +        le16 reserved;
>  };
>  \end{lstlisting}
>
> @@ -235,6 +240,12 @@ \subsection{Device configuration
> layout}\label{sec:Device Types / Network Device
>  Encapsulation types are defined in \ref{sec:Device Types / Network Devic=
e
> / Device Operation / Processing of Incoming Packets /
>  Hash calculation for incoming packets / Encapsulation types
> supported/enabled for inner header hash}.
>
> +Field \field{max_rss_contexts} only exists if VIRTIO_NET_F_RSS_CONTEXT i=
s
> set.
> +This field specifies the maximum number of RSS contexts \ref{sec:Device
> Types / Network Device /
> +Device Operation / Control Virtqueue / RSS Context} supported by the
> device.
> +
> +Field \field{reserved} contains zeroes and is reserved.
> +
>  \devicenormative{\subsubsection}{Device configuration layout}{Device
> Types / Network Device / Device configuration layout}
>
>  The device MUST set \field{max_virtqueue_pairs} to between 1 and 0x8000
> inclusive,
> @@ -285,6 +296,8 @@ \subsection{Device configuration
> layout}\label{sec:Device Types / Network Device
>  The device SHOULD NOT offer VIRTIO_NET_F_CTRL_RX_EXTRA if it
>  does not offer VIRTIO_NET_F_CTRL_VQ.
>
> +The device MUST set \field{max_rss_contexts} to at least 1 if it offers
> VIRTIO_NET_F_RSS_CONTEXT.
> +
>  \drivernormative{\subsubsection}{Device configuration layout}{Device
> Types / Network Device / Device configuration layout}
>
>  The driver MUST NOT write to any of the device configuration fields.
> @@ -1606,6 +1619,63 @@ \subsubsection{Control Virtqueue}\label{sec:Device
> Types / Network Device / Devi
>  \item If the destination receive queue is being reset (See \ref{sec:Basi=
c
> Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}), the devic=
e
> MUST drop the packet.
>  \end{itemize}
>
> +\paragraph{RSS Context}\label{sec:Device Types / Network Device / Device
> Operation / Control Virtqueue / RSS Context}
> +
> +An RSS context consists of configurable parameters specified by
> \ref{sec:Device Types / Network Device
> +/ Device Operation / Control Virtqueue / Receive-side scaling (RSS)}.
> +
> +The RSS configuration supported by the VIRTIO_NET_F_RSS feature is
> implicitly considered the default RSS context.
> +
> +The device offers the feature VIRTIO_NET_F_RSS_CONTEXT if it supports on=
e
> or more RSS contexts (excluding the default RSS context
> +supported by VIRTIO_NET_F_RSS) and configurable parameters.
> +
> +\begin{lstlisting}
> +struct virtnet_rss_ctx_add_modify {
> +    u8 rss_ctx_id;
> +    u8 padding[3];
> +    struct virtio_net_rss_config rss;
> +};
> +
> +struct virtnet_rss_ctx_del {
> +    u8 rss_ctx_id;
> +};
> +
> +#define VIRTNET_RSS_CTX_CTRL 8
> + #define VIRTNET_RSS_CTX_CTRL_ADD  0
> + #define VIRTNET_RSS_CTX_CTRL_MOD  1
> + #define VIRTNET_RSS_CTX_CTRL_DEL  2
> +\end{lstlisting}
> +
> +RSS context parameters:
> +\begin{itemize}
> +\item  \field{rss_ctx_id}: ID of the specific RSS context.
> +\item  \field{rss}: Configure the specific RSS context whose id is
> \field{rss_ctx_id}.
> +\end{itemize}
> +
> +\field{padding} is reserved and it is ignored by the device.
> +
> +If the feature VIRTIO_NET_F_RSS_CONTEXT has been negotiated, the driver
> can send the following
> +VIRTNET_RSS_CTX_CTRL class commands to configure a specific RSS context:
> +\begin{enumerate}
> +\item VIRTNET_RSS_CTX_CTRL_ADD: use the structure
> virtnet_rss_ctx_add_modify to
> +       add an RSS context configured as \field{rss} and id as
> \field{rss_ctx_id} for the device.
> +\item VIRTNET_RSS_CTX_CTRL_MOD: use the structure
> virtnet_rss_ctx_add_modify to
> +       configure parameters of the RSS context whose id is
> \field{rss_ctx_id} as \field{rss} for the device.
> +\item VIRTNET_RSS_CTX_CTRL_DEL: use the structure virtnet_rss_ctx_del to
> delete
> +       the RSS context whose id is \field{rss_ctx_id} for the device.
> +\end{enumerate}
> +
> +For VIRTNET_RSS_CTX_CTRL_ADD and VIRTNET_RSS_CTX_CTRL_MOD commands, the
> structure virtnet_rss_ctx_add_modify is read-only for the device.
> +For the VIRTNET_RSS_CTX_CTRL_DEL command, the structure
> virtnet_rss_ctx_del is read-only for the device.
> +
> +\drivernormative{\subparagraph}{RSS Context}{Device Types / Network
> Device / Device Operation / Control Virtqueue / RSS Context}
> +
> +The driver MUST have negotiated the VIRTIO_NET_F_RSS_CONTEXT feature whe=
n
> issuing the VIRTNET_RSS_CTX_CTRL class commands.
> +
> +The driver MUST set \field{rss_ctx_id} to between 1 and
> \field{max_rss_contexts} inclusive.
> +
> +The driver MUST NOT send the VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET command whe=
n
> the device has responded to the VIRTNET_RSS_CTX_CTRL_ADD command with
> VIRTIO_NET_OK.
> +
>  \paragraph{Offloads State Configuration}\label{sec:Device Types / Networ=
k
> Device / Device Operation / Control Virtqueue / Offloads State
> Configuration}
>
>  If the VIRTIO_NET_F_CTRL_GUEST_OFFLOADS feature is negotiated, the drive=
r
> can
> diff --git a/device-types/net/driver-conformance.tex
> b/device-types/net/driver-conformance.tex
> index 9d853d9..22ff5c3 100644
> --- a/device-types/net/driver-conformance.tex
> +++ b/device-types/net/driver-conformance.tex
> @@ -15,4 +15,5 @@
>  \item \ref{drivernormative:Device Types / Network Device / Device
> Operation / Control Virtqueue / Receive-side scaling (RSS) }
>  \item \ref{drivernormative:Device Types / Network Device / Device
> Operation / Control Virtqueue / Notifications Coalescing}
>  \item \ref{drivernormative:Device Types / Network Device / Device
> Operation / Control Virtqueue / Inner Header Hash}
> +\item \ref{drivernormative:Device Types / Network Device / Device
> Operation / Control Virtqueue / RSS Context}
>  \end{itemize}
> --
> 2.19.1.6.gb485710b
>
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines:
> https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>
>

--00000000000052db800602f9ffb5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Probably worth to clarify: what is the expected persistenc=
y of the RSS context: is it expected to survive device reset? powerdown cyc=
le?<div>If there is some level of persistency, how can external software kn=
ow what contexts that the device contains?</div><div>Should the sub-command=
=C2=A0be defined to apply one of saved contexts?</div><div><br></div><div>T=
hanks,</div><div>Yuri</div><div><br></div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 15, 2023 at 3:36=E2=
=80=AFPM Heng Qi &lt;<a href=3D"mailto:hengqi@linux.alibaba.com">hengqi@lin=
ux.alibaba.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Commit 84a1d9c48200 (&quot;net: ethtool: extend RXNFC API to =
support RSS spreading of<br>
filter matches&quot;) adds support for RSS context as a destination for rec=
eive flow filters<br>
(pls see <a href=3D"https://lists.oasis-open" rel=3D"noreferrer" target=3D"=
_blank">https://lists.oasis-open</a>. org/archives/virtio-comment/202308/ms=
g00194.html).<br>
<br>
An RSS context consists of configurable parameters specified by receive-sid=
e scaling.<br>
<br>
Usecase:<br>
When users want some data flows to be steered to specific multiple rxqs, th=
ey can set<br>
receive flow filter rules for these data flows to an RSS context with desir=
ed rxqs.<br>
<br>
How to set/configure an RSS context:<br>
Assuming no RSS context has been created before.<br>
1. ethtool -X eth0 context new start 5 equal 8<br>
<br>
This command creates an RSS context with an id=3D1 for eth0, and fills in t=
he indirection<br>
table with rxq indexes 5-8 circularly. The hash key and hash types reuse th=
e default<br>
RSS configuration.<br>
<br>
Then, we can use &#39;ethtool -x eth0 context 1&#39; to query the above con=
figuration.<br>
<br>
2. ethtool -X eth0 context new start 6 equal 7 \<br>
=C2=A0 =C2=A0hkey 8f:bf:dd:11:23:58:d2:8a:00:31:d0:32:a3:b5:1f:\<br>
=C2=A0 =C2=A01f:e4:d1:fe:47:7f:64:42:fd:d0:61:16:b8:b0:f9:71:e8:2d:36:7f:18=
:dd:4d:c8:f3<br>
<br>
This command creates an RSS context with an id=3D2 for eth0, and fills in t=
he indirection<br>
table with rxq indexes 6-7 circularly. The hash key is 8f:bf:dd:11:23:58:d2=
:8a:00:31:d0\<br>
:32:a3:b5:1f:1f:e4:d1:fe:47:7f:64:42:fd:d0:61:16:b8:b0:f9:71:e8:2d:36:7f:18=
:dd:4d:c8:f3.<br>
Hash types reuse the default RSS configuration.<br>
<br>
3. ethtool -N eth0 rx-flow-hash tcp4 sdfn context 1<br>
<br>
This command specifies the hash types for the RSS context whose id=3D1 on e=
th0.<br>
Now this RSS context only has the hash key to reuse the default RSS configu=
ration.<br>
<br>
4. ethtool -N eth0 flow-type udp4 src-ip 1.1.1.1 context 1<br>
<br>
This command configures a receive flow filter rule for eth0, and the data f=
low matching<br>
this rule will continue to select the final rxq according to the RSS contex=
t configuration<br>
with id=3D1.<br>
<br>
Signed-off-by: Heng Qi &lt;<a href=3D"mailto:hengqi@linux.alibaba.com" targ=
et=3D"_blank">hengqi@linux.alibaba.com</a>&gt;<br>
---<br>
=C2=A0device-types/net/description.tex=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 70 ++++=
+++++++++++++++++++++<br>
=C2=A0device-types/net/driver-conformance.tex |=C2=A0 1 +<br>
=C2=A02 files changed, 71 insertions(+)<br>
<br>
diff --git a/device-types/net/description.tex b/device-types/net/descriptio=
n.tex<br>
index 76585b0..2deb060 100644<br>
--- a/device-types/net/description.tex<br>
+++ b/device-types/net/description.tex<br>
@@ -88,6 +88,8 @@ \subsection{Feature bits}\label{sec:Device Types / Networ=
k Device / Feature bits<br>
=C2=A0\item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)] Set MAC address through control=
<br>
=C2=A0 =C2=A0 =C2=A0channel.<br>
<br>
+\item[VIRTIO_NET_F_RSS_CONTEXT(50)] Device supports multiple RSS contexts.=
<br>
+<br>
=C2=A0\item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header hash=
 for encapsulated packets.<br>
<br>
=C2=A0\item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtqueue notifi=
cation coalescing.<br>
@@ -150,6 +152,7 @@ \subsubsection{Feature bit requirements}\label{sec:Devi=
ce Types / Network Device<br>
=C2=A0\item[VIRTIO_NET_F_RSS] Requires VIRTIO_NET_F_CTRL_VQ.<br>
=C2=A0\item[VIRTIO_NET_F_VQ_NOTF_COAL] Requires VIRTIO_NET_F_CTRL_VQ.<br>
=C2=A0\item[VIRTIO_NET_F_HASH_TUNNEL] Requires VIRTIO_NET_F_CTRL_VQ along w=
ith VIRTIO_NET_F_RSS or VIRTIO_NET_F_HASH_REPORT.<br>
+\item[VIRTIO_NET_F_RSS_CONTEXT] Requires VIRTIO_NET_F_CTRL_VQ and VIRTIO_N=
ET_F_RSS.<br>
=C2=A0\end{description}<br>
<br>
=C2=A0\subsubsection{Legacy Interface: Feature bits}\label{sec:Device Types=
 / Network Device / Feature bits / Legacy Interface: Feature bits}<br>
@@ -179,6 +182,8 @@ \subsection{Device configuration layout}\label{sec:Devi=
ce Types / Network Device<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0le16 rss_max_indirection_table_length;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0le32 supported_hash_types;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0le32 supported_tunnel_types;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 le16 max_rss_contexts;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 le16 reserved;<br>
=C2=A0};<br>
=C2=A0\end{lstlisting}<br>
<br>
@@ -235,6 +240,12 @@ \subsection{Device configuration layout}\label{sec:Dev=
ice Types / Network Device<br>
=C2=A0Encapsulation types are defined in \ref{sec:Device Types / Network De=
vice / Device Operation / Processing of Incoming Packets /<br>
=C2=A0Hash calculation for incoming packets / Encapsulation types supported=
/enabled for inner header hash}.<br>
<br>
+Field \field{max_rss_contexts} only exists if VIRTIO_NET_F_RSS_CONTEXT is =
set.<br>
+This field specifies the maximum number of RSS contexts \ref{sec:Device Ty=
pes / Network Device /<br>
+Device Operation / Control Virtqueue / RSS Context} supported by the devic=
e.<br>
+<br>
+Field \field{reserved} contains zeroes and is reserved.<br>
+<br>
=C2=A0\devicenormative{\subsubsection}{Device configuration layout}{Device =
Types / Network Device / Device configuration layout}<br>
<br>
=C2=A0The device MUST set \field{max_virtqueue_pairs} to between 1 and 0x80=
00 inclusive,<br>
@@ -285,6 +296,8 @@ \subsection{Device configuration layout}\label{sec:Devi=
ce Types / Network Device<br>
=C2=A0The device SHOULD NOT offer VIRTIO_NET_F_CTRL_RX_EXTRA if it<br>
=C2=A0does not offer VIRTIO_NET_F_CTRL_VQ.<br>
<br>
+The device MUST set \field{max_rss_contexts} to at least 1 if it offers VI=
RTIO_NET_F_RSS_CONTEXT.<br>
+<br>
=C2=A0\drivernormative{\subsubsection}{Device configuration layout}{Device =
Types / Network Device / Device configuration layout}<br>
<br>
=C2=A0The driver MUST NOT write to any of the device configuration fields.<=
br>
@@ -1606,6 +1619,63 @@ \subsubsection{Control Virtqueue}\label{sec:Device T=
ypes / Network Device / Devi<br>
=C2=A0\item If the destination receive queue is being reset (See \ref{sec:B=
asic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}), the de=
vice MUST drop the packet.<br>
=C2=A0\end{itemize}<br>
<br>
+\paragraph{RSS Context}\label{sec:Device Types / Network Device / Device O=
peration / Control Virtqueue / RSS Context}<br>
+<br>
+An RSS context consists of configurable parameters specified by \ref{sec:D=
evice Types / Network Device<br>
+/ Device Operation / Control Virtqueue / Receive-side scaling (RSS)}.<br>
+<br>
+The RSS configuration supported by the VIRTIO_NET_F_RSS feature is implici=
tly considered the default RSS context.<br>
+<br>
+The device offers the feature VIRTIO_NET_F_RSS_CONTEXT if it supports one =
or more RSS contexts (excluding the default RSS context<br>
+supported by VIRTIO_NET_F_RSS) and configurable parameters.<br>
+<br>
+\begin{lstlisting}<br>
+struct virtnet_rss_ctx_add_modify {<br>
+=C2=A0 =C2=A0 u8 rss_ctx_id;<br>
+=C2=A0 =C2=A0 u8 padding[3];<br>
+=C2=A0 =C2=A0 struct virtio_net_rss_config rss;<br>
+};<br>
+<br>
+struct virtnet_rss_ctx_del {<br>
+=C2=A0 =C2=A0 u8 rss_ctx_id;<br>
+};<br>
+<br>
+#define VIRTNET_RSS_CTX_CTRL 8<br>
+ #define VIRTNET_RSS_CTX_CTRL_ADD=C2=A0 0<br>
+ #define VIRTNET_RSS_CTX_CTRL_MOD=C2=A0 1<br>
+ #define VIRTNET_RSS_CTX_CTRL_DEL=C2=A0 2<br>
+\end{lstlisting}<br>
+<br>
+RSS context parameters:<br>
+\begin{itemize}<br>
+\item=C2=A0 \field{rss_ctx_id}: ID of the specific RSS context.<br>
+\item=C2=A0 \field{rss}: Configure the specific RSS context whose id is \f=
ield{rss_ctx_id}.<br>
+\end{itemize}<br>
+<br>
+\field{padding} is reserved and it is ignored by the device.<br>
+<br>
+If the feature VIRTIO_NET_F_RSS_CONTEXT has been negotiated, the driver ca=
n send the following<br>
+VIRTNET_RSS_CTX_CTRL class commands to configure a specific RSS context:<b=
r>
+\begin{enumerate}<br>
+\item VIRTNET_RSS_CTX_CTRL_ADD: use the structure virtnet_rss_ctx_add_modi=
fy to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0add an RSS context configured as \field{rss} an=
d id as \field{rss_ctx_id} for the device.<br>
+\item VIRTNET_RSS_CTX_CTRL_MOD: use the structure virtnet_rss_ctx_add_modi=
fy to<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0configure parameters of the RSS context whose i=
d is \field{rss_ctx_id} as \field{rss} for the device.<br>
+\item VIRTNET_RSS_CTX_CTRL_DEL: use the structure virtnet_rss_ctx_del to d=
elete<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0the RSS context whose id is \field{rss_ctx_id} =
for the device.<br>
+\end{enumerate}<br>
+<br>
+For VIRTNET_RSS_CTX_CTRL_ADD and VIRTNET_RSS_CTX_CTRL_MOD commands, the st=
ructure virtnet_rss_ctx_add_modify is read-only for the device.<br>
+For the VIRTNET_RSS_CTX_CTRL_DEL command, the structure virtnet_rss_ctx_de=
l is read-only for the device.<br>
+<br>
+\drivernormative{\subparagraph}{RSS Context}{Device Types / Network Device=
 / Device Operation / Control Virtqueue / RSS Context}<br>
+<br>
+The driver MUST have negotiated the VIRTIO_NET_F_RSS_CONTEXT feature when =
issuing the VIRTNET_RSS_CTX_CTRL class commands.<br>
+<br>
+The driver MUST set \field{rss_ctx_id} to between 1 and \field{max_rss_con=
texts} inclusive.<br>
+<br>
+The driver MUST NOT send the VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET command when =
the device has responded to the VIRTNET_RSS_CTX_CTRL_ADD command with VIRTI=
O_NET_OK.<br>
+<br>
=C2=A0\paragraph{Offloads State Configuration}\label{sec:Device Types / Net=
work Device / Device Operation / Control Virtqueue / Offloads State Configu=
ration}<br>
<br>
=C2=A0If the VIRTIO_NET_F_CTRL_GUEST_OFFLOADS feature is negotiated, the dr=
iver can<br>
diff --git a/device-types/net/driver-conformance.tex b/device-types/net/dri=
ver-conformance.tex<br>
index 9d853d9..22ff5c3 100644<br>
--- a/device-types/net/driver-conformance.tex<br>
+++ b/device-types/net/driver-conformance.tex<br>
@@ -15,4 +15,5 @@<br>
=C2=A0\item \ref{drivernormative:Device Types / Network Device / Device Ope=
ration / Control Virtqueue / Receive-side scaling (RSS) }<br>
=C2=A0\item \ref{drivernormative:Device Types / Network Device / Device Ope=
ration / Control Virtqueue / Notifications Coalescing}<br>
=C2=A0\item \ref{drivernormative:Device Types / Network Device / Device Ope=
ration / Control Virtqueue / Inner Header Hash}<br>
+\item \ref{drivernormative:Device Types / Network Device / Device Operatio=
n / Control Virtqueue / RSS Context}<br>
=C2=A0\end{itemize}<br>
-- <br>
2.19.1.6.gb485710b<br>
<br>
<br>
This publicly archived list offers a means to provide input to the<br>
OASIS Virtual I/O Device (VIRTIO) TC.<br>
<br>
In order to verify user consent to the Feedback License terms and<br>
to minimize spam in the list archive, subscription is required<br>
before posting.<br>
<br>
Subscribe: <a href=3D"mailto:virtio-comment-subscribe@lists.oasis-open.org"=
 target=3D"_blank">virtio-comment-subscribe@lists.oasis-open.org</a><br>
Unsubscribe: <a href=3D"mailto:virtio-comment-unsubscribe@lists.oasis-open.=
org" target=3D"_blank">virtio-comment-unsubscribe@lists.oasis-open.org</a><=
br>
List help: <a href=3D"mailto:virtio-comment-help@lists.oasis-open.org" targ=
et=3D"_blank">virtio-comment-help@lists.oasis-open.org</a><br>
List archive: <a href=3D"https://lists.oasis-open.org/archives/virtio-comme=
nt/" rel=3D"noreferrer" target=3D"_blank">https://lists.oasis-open.org/arch=
ives/virtio-comment/</a><br>
Feedback License: <a href=3D"https://www.oasis-open.org/who/ipr/feedback_li=
cense.pdf" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-open.org/=
who/ipr/feedback_license.pdf</a><br>
List Guidelines: <a href=3D"https://www.oasis-open.org/policies-guidelines/=
mailing-lists" rel=3D"noreferrer" target=3D"_blank">https://www.oasis-open.=
org/policies-guidelines/mailing-lists</a><br>
Committee: <a href=3D"https://www.oasis-open.org/committees/virtio/" rel=3D=
"noreferrer" target=3D"_blank">https://www.oasis-open.org/committees/virtio=
/</a><br>
Join OASIS: <a href=3D"https://www.oasis-open.org/join/" rel=3D"noreferrer"=
 target=3D"_blank">https://www.oasis-open.org/join/</a><br>
<br>
</blockquote></div>

--00000000000052db800602f9ffb5--
