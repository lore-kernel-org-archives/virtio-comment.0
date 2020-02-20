Return-Path: virtio-comment-return-1077-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A39E5985EF2
	for <virtio-comment@lists.oasis-open.org>; Thu, 20 Feb 2020 07:41:14 +0000 (UTC)
Date: Thu, 20 Feb 2020 02:41:03 -0500 (EST)
From: Yuri Benditovich <ybendito@redhat.com>
Message-ID: <893990295.7352578.1582184463424.JavaMail.zimbra@redhat.com>
In-Reply-To: <623f76be-bf87-c473-350e-87fe53b41261@redhat.com>
References: <20200219075337.23191-1-yuri.benditovich@daynix.com> <20200219075337.23191-2-yuri.benditovich@daynix.com> <86420fd1-cbb4-0105-4114-ca2d6cb3b8ff@redhat.com> <20200219092244-mutt-send-email-mst@kernel.org> <623f76be-bf87-c473-350e-87fe53b41261@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio-comment] [PATCH v4 1/1] virtio-net: Define per-packet
 hash reporting feature
Content-Type: multipart/alternative; 
	boundary="----=_Part_7352577_161686250.1582184463423"
To: Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Yuri Benditovich <yuri.benditovich@daynix.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

------=_Part_7352577_161686250.1582184463423
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

----- Original Message -----

> From: "Jason Wang" <jasowang@redhat.com>
> To: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: "Yuri Benditovich" <yuri.benditovich@daynix.com>,
> virtio-comment@lists.oasis-open.org
> Sent: Thursday, February 20, 2020 8:38:50 AM
> Subject: Re: [virtio-comment] [PATCH v4 1/1] virtio-net: Define per-packe=
t
> hash reporting feature

> On 2020/2/19 =E4=B8=8B=E5=8D=8810:23, Michael S. Tsirkin wrote:
> > On Wed, Feb 19, 2020 at 08:27:10PM +0800, Jason Wang wrote:
> >> On 2020/2/19 =E4=B8=8B=E5=8D=883:53, Yuri Benditovich wrote:
> >>> The device MUST set \field{rss_max_indirection_table_length} to at le=
ast
> >>> 128, if it offers
> >>> VIRTIO_NET_F_RSS.
> >>> @@ -3195,6 +3180,8 @@ \subsection{Device Operation}\label{sec:Device
> >>> Types / Network Device / Device O
> >>> le16 csum_start;
> >>> le16 csum_offset;
> >>> le16 num_buffers;
> >>> + le32 hash_value; (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
> >>> + le16 hash_type; (Only if VIRTIO_NET_F_HASH_REPORT negotiated)
> >>> };
> >>> \end{lstlisting}
> >> A question here:
> >>
> >> Consider we introduce VIRTIO_NET_F_FEATURE_INFORMATION in the future:
> >>
> >> le32 hash_type; // VIRTIO_NET_F_HASH_REPORT
> >> le32 feature_information; // VIRTIO_NET_F_FEATURE_INFORMATION
> >>
> >> What happens if HASH_REPORT is not negotiated, I believe we expect a
> >> stable
> >> ABI(offset) here for feature_information?
> >>
> >> Thanks
> >>
> > We'll have to decide at that point ... any better ideas?

> Not sure but something that is self descriptive? (which could be an
> overkill for fields that only need few bytes).

The problem is that the driver typically wants to know the header size from=
 the beginning to configure SG table.=20
So any self-descriptive layout seems good but in practice not so usable, IM=
O.=20

> Thanks

> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.

> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.

> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/

------=_Part_7352577_161686250.1582184463423
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: courier new,courier,monaco,monospace=
,sans-serif; font-size: 12pt; color: #000000"><div><br></div><div><br></div=
><hr id=3D"zwchr"><blockquote style=3D"border-left:2px solid #1010FF;margin=
-left:5px;padding-left:5px;color:#000;font-weight:normal;font-style:normal;=
text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;=
"><b>From: </b>"Jason Wang" &lt;jasowang@redhat.com&gt;<br><b>To: </b>"Mich=
ael S. Tsirkin" &lt;mst@redhat.com&gt;<br><b>Cc: </b>"Yuri Benditovich" &lt=
;yuri.benditovich@daynix.com&gt;, virtio-comment@lists.oasis-open.org<br><b=
>Sent: </b>Thursday, February 20, 2020 8:38:50 AM<br><b>Subject: </b>Re: [v=
irtio-comment] [PATCH v4 1/1] virtio-net: Define per-packet hash reporting =
feature<br><div><br></div><br>On 2020/2/19 =E4=B8=8B=E5=8D=8810:23, Michael=
 S. Tsirkin wrote:<br>&gt; On Wed, Feb 19, 2020 at 08:27:10PM +0800, Jason =
Wang wrote:<br>&gt;&gt; On 2020/2/19 =E4=B8=8B=E5=8D=883:53, Yuri Benditovi=
ch wrote:<br>&gt;&gt;&gt; &nbsp; &nbsp;The device MUST set \field{rss_max_i=
ndirection_table_length} to at least 128, if it offers<br>&gt;&gt;&gt; &nbs=
p; &nbsp;VIRTIO_NET_F_RSS.<br>&gt;&gt;&gt; @@ -3195,6 +3180,8 @@ \subsectio=
n{Device Operation}\label{sec:Device Types / Network Device / Device O<br>&=
gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;le16 csum_start;<br>&g=
t;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;le16 csum_offset;<br>&g=
t;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;le16 num_buffers;<br>&g=
t;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp;le32 hash_value; (Only if VIRTIO_NE=
T_F_HASH_REPORT negotiated)<br>&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp;le=
16 hash_type; &nbsp;(Only if VIRTIO_NET_F_HASH_REPORT negotiated)<br>&gt;&g=
t;&gt; &nbsp; &nbsp;};<br>&gt;&gt;&gt; &nbsp; &nbsp;\end{lstlisting}<br>&gt=
;&gt; A question here:<br>&gt;&gt;<br>&gt;&gt; Consider we introduce VIRTIO=
_NET_F_FEATURE_INFORMATION in the future:<br>&gt;&gt;<br>&gt;&gt; le32 hash=
_type; // VIRTIO_NET_F_HASH_REPORT<br>&gt;&gt; le32 feature_information; //=
 VIRTIO_NET_F_FEATURE_INFORMATION<br>&gt;&gt;<br>&gt;&gt; What happens if H=
ASH_REPORT is not negotiated, I believe we expect a stable<br>&gt;&gt; ABI(=
offset) here for feature_information?<br>&gt;&gt;<br>&gt;&gt; Thanks<br>&gt=
;&gt;<br>&gt; We'll have to decide at that point ... any better ideas?<br><=
div><br></div><br>Not sure but something that is self descriptive? (which c=
ould be an <br>overkill for fields that only need few bytes).<br></blockquo=
te><div>The problem is that the driver typically wants to know the header s=
ize from the beginning to configure SG table.<br></div><div>So any self-des=
criptive layout seems good but in practice not so usable, IMO.<br></div><di=
v><br></div><div><br></div><blockquote style=3D"border-left:2px solid #1010=
FF;margin-left:5px;padding-left:5px;color:#000;font-weight:normal;font-styl=
e:normal;text-decoration:none;font-family:Helvetica,Arial,sans-serif;font-s=
ize:12pt;">Thanks<br><div><br></div><br>This publicly archived list offers =
a means to provide input to the
<br>OASIS Virtual I/O Device (VIRTIO) TC.
<br><br>In order to verify user consent to the Feedback License terms and
<br>to minimize spam in the list archive, subscription is required
<br>before posting.
<br><br>Subscribe: virtio-comment-subscribe@lists.oasis-open.org
<br>Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
<br>List help: virtio-comment-help@lists.oasis-open.org
<br>List archive: https://lists.oasis-open.org/archives/virtio-comment/
<br>Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.p=
df
<br>List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing=
-lists
<br>Committee: https://www.oasis-open.org/committees/virtio/
<br>Join OASIS: https://www.oasis-open.org/join/<br><div><br></div></blockq=
uote><div><br></div></div></body></html>
------=_Part_7352577_161686250.1582184463423--

