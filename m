Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A695628F5
	for <virtio-comment@lists.linux.dev>; Thu, 20 Feb 2025 01:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740016246; cv=none; b=NaYRNwlVdddNv6FxbwvyeZoQ0aC3hCp1pLJC6EJUJrbtpnnQACj3KrUwynkZyRxQvjs/RdMbaK2+fKiIOYwvChEcWUkXZnygsTGKKYj9XxQR+GNXFUiIJBkAl3bEEkXunS1dtM8ajldk41N5lY6K7x9u3KjOtbLyMOxkI796zGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740016246; c=relaxed/simple;
	bh=VZwFVqM36W1KhF6HNOU3N65vXNhzWRBGsXhIt61aJOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tI1RxHGmWAMGwn5qfDoYbrpiqI0u3czMMjaJpDw6XK26kRWaoqIsDyF85FteBbG63ZXaLef9qPCKTHO8Lc81nTKbrW7aA0g9dRRlJUU6JDEZF07hgYQsKXw6bVqe9uscWAwY5hPrke62Ljk9HljG3dgpIOlgS0AJPsdLnOTdWPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KlXsSr2o; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KlXsSr2o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740016243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fYdMSOvx6jZLM0uOkLLJOJPrQErZh7LNFGuawjMcNzk=;
	b=KlXsSr2oO5ALQz7Ldeeyd5Zp0L2hDWmQkiQMOWtoaQEIq5LEbciHpeOi6eS8lwhEjwGIEs
	CBjjqGwnUcBhbeSpSlkGIqb7HsqdIcW3z6wgRaLGAK0VCjfUrR8gETw9/euQux5sGScDrE
	A0/o06ns6UxVZtV9MRtTEDjDRvdcr4Y=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-85rBpFtlMY-j9vs8oCjOHg-1; Wed, 19 Feb 2025 20:50:41 -0500
X-MC-Unique: 85rBpFtlMY-j9vs8oCjOHg-1
X-Mimecast-MFC-AGG-ID: 85rBpFtlMY-j9vs8oCjOHg_1740016241
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fc17c3eeb5so1121993a91.1
        for <virtio-comment@lists.linux.dev>; Wed, 19 Feb 2025 17:50:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740016241; x=1740621041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYdMSOvx6jZLM0uOkLLJOJPrQErZh7LNFGuawjMcNzk=;
        b=sX+OOvRMUH62LuIyhUoIWkeugJBE7wSGTiVyMOJsj9d3Xr+DBfGiQUSv+d+PmblSlA
         nF7f5Cj2G3wQ/LochA7EPKNhPUoiC392E0hlhnNNO+mRkvcEewFhkCL3sfhGW8vhONMC
         kQU2z4DNp1Gm7M9fdVd8Ng1t35oYGTt8t82Btv5RWS4jlHx18zCu8Ko5d7GdUGshUPuH
         vFuou00uLnCuXV3VPH0Qt5s0R+3i/KSHQHMCA7d6DOzSFaKH07U4q36q3ddS8IxyKYrg
         HKd4TNHMvIkfFwhNqnaBPbDapaYo8nvZPyAxKZr+fWrsjz3YzjdEmOnjP+J7L8Wxf97J
         Savw==
X-Forwarded-Encrypted: i=1; AJvYcCV+DMLXAYH9x4SHJesRSZTG8CbMpt/Q7b4624y9MaWbAT2usgqSVEAR5vfVjF5cJUdB7d2uOZfQuiiTccQeUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDYUJNCS20JMzuCdSeqeDvVQEUCLD+f29PJWxw/aTIfr4s2OBA
	ULb13lRKRYhW7+XxwBsjDzrWN7Xl/1gQhWUVcYKopxrhHv/YW2RBYkjvmssnY7UX20rr3PGRKEX
	Q0mktdGdhkZtLVwUh71qThJX28D5KlcXEj6XpvN8IUjENXXjjYzdGy+GP4AHa2Z8eppNk98leLv
	melkix1mvs9XUpRQ56E41h5eC8MKlAbcaNo2zc9Zk=
X-Gm-Gg: ASbGncvA3gw5rFNqzEagU7YKtHPT4/SIYcZfzeqzm/QZXBD+DY9gn6po1ZJcgfthXON
	vEB0pR7KGhVp2X6q4gQFCJGjakz0PCkXFe9A/NSIs4J4Rj3K5ET84PYk+BnA8a20=
X-Received: by 2002:a17:90b:2789:b0:2f1:30c8:6e75 with SMTP id 98e67ed59e1d1-2fc4115438dmr26924165a91.32.1740016240852;
        Wed, 19 Feb 2025 17:50:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVJ4mwoBA8sJtZby2H0iblHWgIzciQUgIOXznAJaVgrY8P0aWljP7HK/uVMPdxH5QFzLAaNrgU4mBwz90k8/w=
X-Received: by 2002:a17:90b:2789:b0:2f1:30c8:6e75 with SMTP id
 98e67ed59e1d1-2fc4115438dmr26924129a91.32.1740016240417; Wed, 19 Feb 2025
 17:50:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250217172509.107212-1-kshankar@marvell.com> <CACGkMEubUH6YtZHK7sEjj6fvWZ5_k0rQ9H6U2Li4GP0Txi-yJA@mail.gmail.com>
 <CH0PR18MB426010C71F7B3681C14C6F95DFC52@CH0PR18MB4260.namprd18.prod.outlook.com>
In-Reply-To: <CH0PR18MB426010C71F7B3681C14C6F95DFC52@CH0PR18MB4260.namprd18.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 20 Feb 2025 09:50:29 +0800
X-Gm-Features: AWEUYZmPM2FAIS4KKh_7sdEcl-7s06Yh-EbLWB2HRR6OUyDJvjcxGacUSsmC6QM
Message-ID: <CACGkMEvZ7YfQr262Qe_ocsjN_ULeqh_sHkJqeqAaOoqOy7OoVQ@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [PATCH v3] virtio-net: Introduce a new field to
 indicate outer network header offset
To: Shiva Shankar Kommula <kshankar@marvell.com>
Cc: "pabeni@redhat.com" <pabeni@redhat.com>, "willemb@google.com" <willemb@google.com>, 
	"parav@nvidia.com" <parav@nvidia.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, 
	Nithin Kumar Dabilpuram <ndabilpuram@marvell.com>, Jerin Jacob <jerinj@marvell.com>, 
	Rahul Bhansali <rbhansali@marvell.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PDqofP68aDp74AYrf3bZqzglWfQpJZ7UOPBwzcCVoPA_1740016241
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 2:40=E2=80=AFPM Shiva Shankar Kommula
<kshankar@marvell.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Wednesday, February 19, 2025 9:00 AM
> > To: Shiva Shankar Kommula <kshankar@marvell.com>
> > Cc: pabeni@redhat.com; willemb@google.com; parav@nvidia.com; virtio-
> > comment@lists.linux.dev; Nithin Kumar Dabilpuram
> > <ndabilpuram@marvell.com>; Jerin Jacob <jerinj@marvell.com>; Rahul
> > Bhansali <rbhansali@marvell.com>
> > Subject: [EXTERNAL] Re: [PATCH v3] virtio-net: Introduce a new field to
> > indicate outer network header offset
> >
> > On Tue, Feb 18, 2025 at 1:=E2=80=8A25 AM Kommula Shiva Shankar
> > <kshankar@=E2=80=8Amarvell.=E2=80=8Acom> wrote: > > This patch introduc=
es a new field in the
> > virtio_net_header called out_nh_offset, along with a new net device fea=
ture,
> > VIRTIO_NET_F_OUT_NET_HEADER.
> > On Tue, Feb 18, 2025 at 1:25=E2=80=AFAM Kommula Shiva Shankar
> > <kshankar@marvell.com> wrote:
> > >
> > > This patch introduces a new field in the virtio_net_header called
> > out_nh_offset, along with a new net device feature,
> > VIRTIO_NET_F_OUT_NET_HEADER.
> > >
> > > Currently, drivers lack a dedicated field to signal the start of the
> > > network header to the device when performing checksum offload and
> > segmentation offload. This requires reading packet, which significantly=
 affects
> > performance in datapath.
> > > Additionally, some hardware implementations requrie knowledege of the
> > outer L3 offset (aka L2 length) for inline IPSec hardware acceleration.
> > >
> > > To address this limitation, we propose splitting the csum_offset fiel=
d into
> > two 8-bit fields named csum_offset and out_nh_offset.
> > > The csum_offset indicates the offset value from the csum_start and
> > > may not exceed 256B bits(2^8) for protocols that use a 16-bit one's
> > > complement checksum
> > >
> > > Following table lists such protocols and their checksum offset fields
> > > within their headers
> > >
> > > +-----+--------+
> > > |Proto|csum_off|
> > > +-----+--------+
> > > | IPV4| 10B    |
> > > | ICMP| 2B     |
> > > | IGMP| 2B     |
> > > |  TCP| 16B    |
> > > |  UDP| 6B     |
> > > +-----+--------+
> > >
> > > The out_nh_offset represents the start byte offset of the outer
> > > network header from the beginning of the packet
> > >
> > > This issue was briefly discussed on the mailing list in a different
> > > thread, which can be found here
> > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.or=
g_a
> > > ll_DM4PR18MB4269FAAC3CFC7E57E25DFBD2DF8B2-
> > 40DM4PR18MB4269.namprd18.pro
> > >
> > d.outlook.com_&d=3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DXP728rR_yI3b
> > CCyFq0M
> > > EWPS2176D_oSryc7cD-
> > 0TRPs&m=3DjajIHiJb18aASNFHlkOtvANrA_06lDHp6zG9AEFU8u_
> > > nHyksxDbHI3UT0OFedi-b&s=3DMR9AX0Md9PFbZjQM-
> > bwJAmO13ZwETRZJCm9qFIYDy6E&e=3D
> > >
> > > v2 -> v3:
> > >  - Rebase to virtio-1.4
> > >  - Addressed pending review commnets related to wording.
> > >
> > > v2 -
> > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.or=
g_a
> > > ll_20250128142152.3662988-2D1-2Dkshankar-
> > 40marvell.com_&d=3DDwIFaQ&c=3DnKj
> > > Wec2b6R0mOyPaz7xtfQ&r=3DXP728rR_yI3bCCyFq0MEWPS2176D_oSryc7cD-
> > 0TRPs&m=3Dja
> > > jIHiJb18aASNFHlkOtvANrA_06lDHp6zG9AEFU8u_nHyksxDbHI3UT0OFedi-
> > b&s=3DjvYZB
> > > QtOwWyydI5lFvCFz4hF94jDmU70nROTU44Ma0M&e=3D
> > >
> > > v1 -> v2:
> > >  - explicitly state that the out_nh_offset can be set only when a val=
id
> > network header is present.
> > >  - updated out_nh_offset usage in the RX direction.
> > >  - minor word cleanup.
> > >
> > > v1 -
> > > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lore.kernel.or=
g_v
> > > irtio-2Dcomment_20250114171636.3175670-2D1-2Dkshankar-
> > 40marvell.com_&d
> > >
> > =3DDwIFaQ&c=3DnKjWec2b6R0mOyPaz7xtfQ&r=3DXP728rR_yI3bCCyFq0MEWPS217
> > 6D_oSryc7
> > > cD-
> > 0TRPs&m=3DjajIHiJb18aASNFHlkOtvANrA_06lDHp6zG9AEFU8u_nHyksxDbHI3UT
> > 0OF
> > > edi-b&s=3DrzyoQrmZTznG5V9N03u7bpPbG1uQC0WPFmypJJKS9r8&e=3D
> > >
> > > Signed-off-by: Kommula Shiva Shankar <kshankar@marvell.com>
> > > ---
> > >  device-types/net/description.tex | 37
> > > ++++++++++++++++++++++++++++++++
> > >  1 file changed, 37 insertions(+)
> > >
> > > diff --git a/device-types/net/description.tex
> > > b/device-types/net/description.tex
> > > index b546cd7..2a4aa66 100644
> > > --- a/device-types/net/description.tex
> > > +++ b/device-types/net/description.tex
> > > @@ -136,6 +136,10 @@ \subsection{Feature bits}\label{sec:Device Types
> > > / Network Device / Feature bits
> > >
> > >  \item[VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO_CSUM (68)] Device
> > handles packets
> > >    carried by a UDP tunnel with partial csum for the outer header.
> > > +
> > > +\item[VIRTIO_NET_F_OUT_NET_HEADER(69)] Driver can provide the start
> > > +of \field{out_nh_offset}  value. Device gains advantage by not
> > > +reading packet to calculate outer network  header offset
> > >  \end{description}
> > >
> > >  \subsubsection{Feature bit requirements}\label{sec:Device Types /
> > > Network Device / Feature bits / Feature bit requirements} @@ -592,6
> > +596,13 @@ \subsection{Device Operation}\label{sec:Device Types / Netwo=
rk
> > Device / Device O
> > >          le16 hdr_len;
> > >          le16 gso_size;
> > >          le16 csum_start;
> > > +        union {
> > > +                le16 csum_offset;
> > > +                struct {        /* Only if VIRTIO_NET_F_OUT_NET_HEAD=
ER
> > negotiated */
> > > +                        le8 csum_offset;
> > > +                        le8 out_nh_offset;
> >
> > Need some explanation why reusing csum_offset is better than introducin=
g
> > new fields.
> Our objective is to preserve the current size of the virtio_net_hdr struc=
ture, to ensure compatibility with the existing header size.
> (unlike other features such as hash reporting). Given that the csum_offse=
t represents an offset within the header and may not
> exceed 2^8, we propose utilizing the existing space to accommodate this n=
ewly introduced field.
>
> Would it be more prudent to add a new field for this feature ? Do you for=
esee any issues with this approach ?

It might have some compatibility issue. For example in the current
Linux implementation, csum_offset were 1:1 mapped to skb->csum_offset
which is a u16.

I haven't checked all the protocols (especially the tunnels) but if
one day there's a protocol that uses a csum_offset >=3D 256, it would be
problematic.

Thanks

> >
> > > +                };
> > > +        };
> > >          le16 csum_offset;
> >
> > It seems like it needs to be removed.
> ACK .
> Inadvertently included in version 3. Will fix up and send version4
> >
> > >          le16 num_buffers;
> > >          le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT
> > negotiated)
> >
> > Thanks
>

