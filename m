Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0CE1D61AA
	for <virtio-comment@lists.linux.dev>; Wed, 30 Apr 2025 05:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745990726; cv=none; b=FYqs0sIeUGWW4gCniy2nSGaXIQ6LzJvY15hz6hgBsieMUwl519a3y3NaMLbeKrGomPkliG+U/LBI6P29LKu7xxXQ/+DyX0+cJVMoWITJLCaUSZhXsVwvVKA0FpQng78SbOw5yHctyU4TVrGWfFHtuXFM4Bd4Uz9kixjcHVd70xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745990726; c=relaxed/simple;
	bh=AYVANy9JajjP0dATHYSuDC/j86SSBwoiV87VddGwBug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J4+UaP3sUfAzs8Wt3e7uLwKHjpOfpmRQ6VREav4BPx6jO5pBAXTcATTJltD/Qp9aVCEFiAlCmOvI0GQB9c4nbo1hWtUPFqRodGrJVH895S6ZHG3gSlJJPZp3tjSdy4Qi1XFNwB4/yhpx67A/BOwCNgmtLQoUKZumNnN3D78k6Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=VRpY8Xbb; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="VRpY8Xbb"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4769bbc21b0so81686551cf.2
        for <virtio-comment@lists.linux.dev>; Tue, 29 Apr 2025 22:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1745990722; x=1746595522; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Aj8jx+EanpVmc+xjkUA05OvTl+asrNJp0DgomdICM3o=;
        b=VRpY8XbbOHHU+Eres/mC72jCieaNvygT9qRT+CvHMiBQnIwkxyxqWI4iPq7EgD2/LP
         EGhOgYTVUQSWSATS0NyLKSdsZF39RmW8BN6YxHPS8z9pKrOttnoKeDgIxM04mboASrEQ
         388rSit43mMJzSqVqcGQPXFppVWjzTtJ5s3iZ562BAr2/CEVRkNANQhaqdZg+XtvMM4H
         iATnvJ2mGM5DJ16zzFPWqjJBsGCK9ipFD/aOzWca1Cvb9PinDzZZth4E0IFy3UNBnavv
         AocDAVnpqIe53fIi5o6h471AkQV13wMhWISTUeBhHN5/3Kqr/Oix1k39ot1wKpj6tXJY
         CUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745990722; x=1746595522;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aj8jx+EanpVmc+xjkUA05OvTl+asrNJp0DgomdICM3o=;
        b=UdIC6SJAsVFks83QGziAo4/E2M4buCpcJq77pNiULPpL8NfZwWnuKqvBlgWdvqJpzK
         2k09Zw7HXcmoyFUCICVYWyGZyGRWHbI25p1FvHdbsAsu4L/2OkS3DgqRk0aFcg/+Xgbr
         n4Q2+7Eex0Z7dZp5ql0uuCE8MiEv3I6iz5F8UhD7EbZoQ8UQt3rIDePA3ewb6XowJGjl
         8RZO6/dDT+XrlN80OhBvGjGHU0JeO8z4qGRA5njpEOKmb/RgcNF/G6uMq8S33RWgm1wu
         NQoMkpn1u1ixEVVoTTSMMIdVy7jF3ZAue0Wn2iUSUzAam9sPnwmp+8YoWAn75njQWvuq
         on1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxnPGsBP2AoY3AEVx6lOblyVTQXyhCGrXSkiHjLX6SjYRfqIvaYr2OoWgKALsiMRauDoepkd0oLpWnDGJm5A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxthg/s9Y/KBuMDTBQ4QBOLMdUHU0yFc73xw7ex6I5ctnX8flj5
	7DiF7dpUPJ+r59PB4KflsGBj1b4BRXv2e/XEZPoeLzBDQOv949f3RDvIngngaUe2dZsNqGQV0aq
	C+C2WaaLH7TMxwCSOe0CuzwsCRaQVzhx7B26YQQ==
X-Gm-Gg: ASbGncsQfbWTpek/pd5xUpBmx3l187si9T2c0UTdYAEDURvNbqylg3HsTO8DTC08ODj
	j7Zh2PghTZLEEpU0tTdfKTpBoaKtt0Y5iWsOqS/d+Ce4L3mhnpzEq2gwieZyANGLaZKF+MyBE/T
	QNPv/mEdXnHWmfdk016OI0y3oxRrZt1RAaOlJH8MaNPAK2sC7jzpejkO/S
X-Google-Smtp-Source: AGHT+IHO8YhWK1Lor2EgQpxYcBaAOkWA0unN070RYjb1lY4UighGQi6DJu4vDgz5XJ6Ht83sYLOSN1Cv9266ePzd6gw=
X-Received: by 2002:a05:622a:5c06:b0:476:7018:9ae4 with SMTP id
 d75a77b69052e-489c3c8d65cmr33089531cf.16.1745990722458; Tue, 29 Apr 2025
 22:25:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250126062058.13695-1-parav@nvidia.com> <d76dc63e-8d4b-4a90-8765-0148d9c7b885@redhat.com>
 <20250423014257-mutt-send-email-mst@kernel.org> <CABVzXA=Uof+TdU6H+eoiOOVjCZwfXfnLV8wAMP87Gz4G92fncA@mail.gmail.com>
 <20250423140404-mutt-send-email-mst@kernel.org> <bb5dd95a-15d5-4785-822c-e2b1e773950c@redhat.com>
 <20250429164256-mutt-send-email-mst@kernel.org> <CY8PR12MB7195AB46624A4339A305BE1CDC832@CY8PR12MB7195.namprd12.prod.outlook.com>
In-Reply-To: <CY8PR12MB7195AB46624A4339A305BE1CDC832@CY8PR12MB7195.namprd12.prod.outlook.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Wed, 30 Apr 2025 08:25:11 +0300
X-Gm-Features: ATxdqUFi5QFbwpSAO7oaeFzd6vubW4ds-C9huJi2u7A3r0NpNsIvhyB7hJYm6Y4
Message-ID: <CAOEp5OcmEbDvfr03XHVQnaFDyOxSRCO0scuW9JLqbi4XkuvOkw@mail.gmail.com>
Subject: Re: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Abeni <pabeni@redhat.com>, 
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"mvaralar@redhat.com" <mvaralar@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Willem de Bruijn <willemb@google.com>, 
	Daniel Verkamp <dverkamp@chromium.org>
Content-Type: multipart/alternative; boundary="000000000000cb251c0633f824f9"

--000000000000cb251c0633f824f9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Windows driver does not use RSS_CONTEXT yet. But this is not the
last addition of an offload feature, so we'll face the same problem later.
I also do not see any risks in option 2.


On Wed, Apr 30, 2025 at 7:44=E2=80=AFAM Parav Pandit <parav@nvidia.com> wro=
te:

>
>
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, April 30, 2025 2:14 AM
> >
> > On Mon, Apr 28, 2025 at 10:39:59AM +0200, Paolo Abeni wrote:
> > > On 4/23/25 8:07 PM, Michael S. Tsirkin wrote:
> > > > On Wed, Apr 23, 2025 at 09:29:11AM -0700, Daniel Verkamp wrote:
> > > >> On Tue, Apr 22, 2025 at 10:46=E2=80=AFPM Michael S. Tsirkin <mst@r=
edhat.com
> >
> > wrote:
> > > >>> I'm afraid we'll have to bite the bullet.
> > > >>
> > > >> One other issue with bits > 63 is that the vhost-user protocol
> > > >> VHOST_USER_GET_FEATURES and VHOST_USER_SET_FEATURES
> > messages use
> > > >> u64 to represent the features, so vhost-user-net devices can't
> > > >> query or enable these features. vhost-user is outside the scope of
> > > >> the virtio spec, though, and I think it's reasonable to extend the
> > > >> protocol to enable high feature bits rather than avoiding them
> forever.
> > > >
> > > > Yes you would use VHOST_USER_SET_PROTOCOL_FEATURES to make
> > > > VHOST_USER_GET_FEATURES return two u64s, or even a new message
> > returning an array.
> > >
> > > I think that additionally the VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET
> > > command will need some clarification, as in the current text looks a
> > > bit
> > > inconsistent:
> > >
> > > """
> > > // in Offloads State Configuration / Setting Offloads State:
> > >
> > > #define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO  46
> > >
> > > // ...
> > >
> > > The class VIRTIO_NET_CTRL_GUEST_OFFLOADS has one command:
> > > VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET applies the new offloads
> > configuration.
> > >
> > > le64 value passed as command data is a bitmask, bits set define
> > > offloads to be enabled, bits cleared - offloads to be disabled.
> > >
> > > There is a corresponding device feature for each offload. Upon featur=
e
> > > negotiation corresponding offload gets enabled to preserve backward
> > > compatibility """
> > >
> > > The "corresponding device feature" has the same numerical value of th=
e
> > > selected offloads, except for UDP tunnels related one (which are
> > > mapped to bits corresponding to reserved features).
> > >
> > > It's unclear to me which should be the better way to address this
> > > inconsistency.
> > >
> > > /P
> >
> >
> > Parav, what's your take here? Given your change broke
> > VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET, do you want to revert it?
>
> I see two options.
> Opt_1:
> Open source Linux kernel driver and DPDK PMD has not used RSS_CONTEXT yet=
.
> If Heng from Alibaba acks that they do not have any internal
> implementation either, it may be safe to shift _all_ feature > 63 to lowe=
r
> position.
> We can get Yuri's feedback, if at all windows driver has used RSS context=
.
>
> And once for all we mark it that feature bits are limited to 0-63.
> There is enough infrastructure in place in virtio spec to not try to
> squeeze things in feature bits.
> And these 4 bits are good example of it already, which could have been
> negotiated/communicated at later phase of driver at runtime.
> Only bit required was a bit to expand vnet header size at early stage.
>
> Advantage: brings the good practice to adapt to the modern and efficient
> driver->device interface.
> Risk: May break RSS_CONTEXT (risk looks low)
>
> Opt_2. VIRTIO_NET_CTRL_GUEST_OFFLOADS command text to be updated to
> indicate that,
>
> Below defines corresponds to respective feature bits 65 to 68. There is
> still one to one mapping, its just position is different inside the class=
.
> This is clarification text to be added and sw can adjust for it.
>
> #define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO 46
> #define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM 47
> #define VIRTIO_NET_F_GUEST_USO4 54
> #define VIRTIO_NET_F_GUEST_USO6 55
>
> Advantages of 2nd option are:
> a. featuring bits remain open upto 127.
> b. Does not break RSS_CONTEXT.
>
> Both options are practical to me.
> I prefer #1, if Heng acks it, but also ok for #2.
>

--000000000000cb251c0633f824f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Windows driver does not use RSS_CONTEXT yet. But this=C2=
=A0is=C2=A0not the last=C2=A0addition of an offload feature, so we&#39;ll f=
ace the same=C2=A0problem later.<div>I also do not see any risks in option =
2.</div><div><br></div></div><br><div class=3D"gmail_quote gmail_quote_cont=
ainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 30, 2025 at 7:44=
=E2=80=AFAM Parav Pandit &lt;<a href=3D"mailto:parav@nvidia.com">parav@nvid=
ia.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><br>
<br>
&gt; From: Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redhat.com" target=
=3D"_blank">mst@redhat.com</a>&gt;<br>
&gt; Sent: Wednesday, April 30, 2025 2:14 AM<br>
&gt; <br>
&gt; On Mon, Apr 28, 2025 at 10:39:59AM +0200, Paolo Abeni wrote:<br>
&gt; &gt; On 4/23/25 8:07 PM, Michael S. Tsirkin wrote:<br>
&gt; &gt; &gt; On Wed, Apr 23, 2025 at 09:29:11AM -0700, Daniel Verkamp wro=
te:<br>
&gt; &gt; &gt;&gt; On Tue, Apr 22, 2025 at 10:46=E2=80=AFPM Michael S. Tsir=
kin &lt;<a href=3D"mailto:mst@redhat.com" target=3D"_blank">mst@redhat.com<=
/a>&gt;<br>
&gt; wrote:<br>
&gt; &gt; &gt;&gt;&gt; I&#39;m afraid we&#39;ll have to bite the bullet.<br=
>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; One other issue with bits &gt; 63 is that the vhost-user=
 protocol<br>
&gt; &gt; &gt;&gt; VHOST_USER_GET_FEATURES and VHOST_USER_SET_FEATURES<br>
&gt; messages use<br>
&gt; &gt; &gt;&gt; u64 to represent the features, so vhost-user-net devices=
 can&#39;t<br>
&gt; &gt; &gt;&gt; query or enable these features. vhost-user is outside th=
e scope of<br>
&gt; &gt; &gt;&gt; the virtio spec, though, and I think it&#39;s reasonable=
 to extend the<br>
&gt; &gt; &gt;&gt; protocol to enable high feature bits rather than avoidin=
g them forever.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Yes you would use VHOST_USER_SET_PROTOCOL_FEATURES to make<b=
r>
&gt; &gt; &gt; VHOST_USER_GET_FEATURES return two u64s, or even a new messa=
ge<br>
&gt; returning an array.<br>
&gt; &gt;<br>
&gt; &gt; I think that additionally the VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET<=
br>
&gt; &gt; command will need some clarification, as in the current text look=
s a<br>
&gt; &gt; bit<br>
&gt; &gt; inconsistent:<br>
&gt; &gt;<br>
&gt; &gt; &quot;&quot;&quot;<br>
&gt; &gt; // in Offloads State Configuration / Setting Offloads State:<br>
&gt; &gt;<br>
&gt; &gt; #define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO=C2=A0 46<br>
&gt; &gt;<br>
&gt; &gt; // ...<br>
&gt; &gt;<br>
&gt; &gt; The class VIRTIO_NET_CTRL_GUEST_OFFLOADS has one command:<br>
&gt; &gt; VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET applies the new offloads<br>
&gt; configuration.<br>
&gt; &gt;<br>
&gt; &gt; le64 value passed as command data is a bitmask, bits set define<b=
r>
&gt; &gt; offloads to be enabled, bits cleared - offloads to be disabled.<b=
r>
&gt; &gt;<br>
&gt; &gt; There is a corresponding device feature for each offload. Upon fe=
ature<br>
&gt; &gt; negotiation corresponding offload gets enabled to preserve backwa=
rd<br>
&gt; &gt; compatibility &quot;&quot;&quot;<br>
&gt; &gt;<br>
&gt; &gt; The &quot;corresponding device feature&quot; has the same numeric=
al value of the<br>
&gt; &gt; selected offloads, except for UDP tunnels related one (which are<=
br>
&gt; &gt; mapped to bits corresponding to reserved features).<br>
&gt; &gt;<br>
&gt; &gt; It&#39;s unclear to me which should be the better way to address =
this<br>
&gt; &gt; inconsistency.<br>
&gt; &gt;<br>
&gt; &gt; /P<br>
&gt; <br>
&gt; <br>
&gt; Parav, what&#39;s your take here? Given your change broke<br>
&gt; VIRTIO_NET_CTRL_GUEST_OFFLOADS_SET, do you want to revert it?<br>
<br>
I see two options.<br>
Opt_1: <br>
Open source Linux kernel driver and DPDK PMD has not used RSS_CONTEXT yet.<=
br>
If Heng from Alibaba acks that they do not have any internal implementation=
 either, it may be safe to shift _all_ feature &gt; 63 to lower position.<b=
r>
We can get Yuri&#39;s feedback, if at all windows driver has used RSS conte=
xt.<br>
<br>
And once for all we mark it that feature bits are limited to 0-63.<br>
There is enough infrastructure in place in virtio spec to not try to squeez=
e things in feature bits.<br>
And these 4 bits are good example of it already, which could have been nego=
tiated/communicated at later phase of driver at runtime.<br>
Only bit required was a bit to expand vnet header size at early stage.<br>
<br>
Advantage: brings the good practice to adapt to the modern and efficient dr=
iver-&gt;device interface.<br>
Risk: May break RSS_CONTEXT (risk looks low)<br>
<br>
Opt_2. VIRTIO_NET_CTRL_GUEST_OFFLOADS command text to be updated to indicat=
e that,<br>
<br>
Below defines corresponds to respective feature bits 65 to 68. There is sti=
ll one to one mapping, its just position is different inside the class.<br>
This is clarification text to be added and sw can adjust for it.<br>
<br>
#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO 46<br>
#define VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM 47<br>
#define VIRTIO_NET_F_GUEST_USO4 54<br>
#define VIRTIO_NET_F_GUEST_USO6 55<br>
<br>
Advantages of 2nd option are:<br>
a. featuring bits remain open upto 127.<br>
b. Does not break RSS_CONTEXT.<br>
<br>
Both options are practical to me.<br>
I prefer #1, if Heng acks it, but also ok for #2.<br>
</blockquote></div>

--000000000000cb251c0633f824f9--
