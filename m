Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23053139590
	for <virtio-comment@lists.linux.dev>; Wed,  3 Jul 2024 07:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719993568; cv=none; b=RhoRNCRM3eSGuZ5mDmTWN5XFHKXgf/inpRwz/xEhe319MI/VXe/givb+ZvJwng1fgzPRupXSWTrPqqMGQsI5LLy9UUiIF2JT7IOpTZZ8stcGNbozyzKFnjUbsm4H3Mpc4ZOLQyBIA8jY2fL4lgKAwmc9kmJFKgUQlzduXKzBp7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719993568; c=relaxed/simple;
	bh=9LVPrn9dlootLRYEnS/KlzjpJKvaI1LQqpBAiXZY4gk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tcq1CJ4MzF12Fee11qgVyAU0exVAf/FIN/IIadMCJx8SRTnJmxWAqa+cVULR6M7A6WLOKZt5E+IdJFop6LfW43V1C9jXZWQ9iHVvbjG/zNllh2GmUFOLIWU90XBk7SJ3Ldt3jH3PPNNH+2kZ0B860DhBk0bOeJCWl/HKWAyIvPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mig2jfrd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mig2jfrd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719993566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=amQlnBySbE67McJ+s7BwU9cxz3J1XyCKbVEoyK2dejI=;
	b=Mig2jfrdPsHe0i/RR3SHW/bgKa4whG5mL8gGmjXYLCTUGQXIAMXmz1eenPtwJCJDOL2zt1
	2CZNCiv2tsM85r4vtqwDQZXeCUdsWyZK3QmFQyfyDB01fVBarVITEdmGpGjzZ/baS6J8UJ
	tlW/5Kdmug+9+vbSbS1vImpNP6zAnAI=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-G4pZKQgZMo2Ut4h-ZPNo-A-1; Wed, 03 Jul 2024 03:59:24 -0400
X-MC-Unique: G4pZKQgZMo2Ut4h-ZPNo-A-1
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3d55cac1d31so4255073b6e.2
        for <virtio-comment@lists.linux.dev>; Wed, 03 Jul 2024 00:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719993564; x=1720598364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=amQlnBySbE67McJ+s7BwU9cxz3J1XyCKbVEoyK2dejI=;
        b=cRCGiOwgsajcZ5l7HBxamDXBK/gsQGz+9kCtQIX5CSWAvY6yk0s19HlH0G7oZ0dRKe
         oi327Rcpl0CyR5jDoZN6a6ecZpMz65eRaWD4moG+rSOWKEaoIjpP5y+o3LOW+sSUDkT2
         P+TRgzP8zAo1bSae3ntPwNx89uQSWNbfQ24pBQGgx/4d5PfmHYYAqKD2FVptNV2C+BL0
         E960qE5lKj0HuLll7qYAxLP87SXLz5590RhucM6ptEBy6GI2qZ1722B0mUt5XFyxZ5Nb
         R8vE/5yhqiRn4Q4cNIxxKS29BrIlobBTlTBgURERgM7edJUWrIOhUehNiFuTO9NFxz9t
         kyiQ==
X-Gm-Message-State: AOJu0Yw0l3Or1EG+dILYlw7E7VGr0xrEsbZxdn9dA5PszXyxZCzTY0E0
	mlz6XzlRhHp2AnUZj71Uj11JJCdE6t0BzHhpcHvKru4Uj/URKo+zpD6NMYQD9/t1rOnUzOBfgbC
	kHjqbsfzrigQOuAD1yA0zshrRfx5XO3ogXDG/aP+v5ScN5F3KQr9/jHRo+skFUmUJ/VTa7hrhVC
	o994f7HOnYOH9xYPKsWX1rlwK8uFfqefSasOwdFRk=
X-Received: by 2002:a05:6808:14d6:b0:3d5:6277:73b with SMTP id 5614622812f47-3d6b4de2902mr10166161b6e.42.1719993563844;
        Wed, 03 Jul 2024 00:59:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETAqnD3df4+LeNQT+aHECkJ5hVyVj0sjKM3M4JVmBBMAiUHndx5MrLsEB8a6K7VxgBEE8O6Z6H3Ik2cOF57K8=
X-Received: by 2002:a05:6808:14d6:b0:3d5:6277:73b with SMTP id
 5614622812f47-3d6b4de2902mr10166151b6e.42.1719993563436; Wed, 03 Jul 2024
 00:59:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
 <CACGkMEvrHNnjdgC6Ls=YWRPFxpirCFkbf8_VnNsh-VU4NoK3tw@mail.gmail.com>
 <SI2PR06MB53850C468CF18A489A6E1ED4FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <CACGkMEtzcaUAauzpUdwjS6MEzF-suGLRv5+7cX4PeoAaqEP9hg@mail.gmail.com> <SI2PR06MB5385A261415EB70720DA5749FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
In-Reply-To: <SI2PR06MB5385A261415EB70720DA5749FFDD2@SI2PR06MB5385.apcprd06.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 3 Jul 2024 15:59:11 +0800
Message-ID: <CACGkMEs46tCCqCcoeJ0nqOn6SRk0qqS72GSwgyt2m5p4BvNnrQ@mail.gmail.com>
Subject: Re: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new used buffer
 notification suppression mechanism
To: Lege Wang <lege.wang@jaguarmicro.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, 
	"vattunuru@marvell.com" <vattunuru@marvell.com>, "ndabilpuram@marvell.com" <ndabilpuram@marvell.com>, 
	"parav@nvidia.com" <parav@nvidia.com>, "mst@redhat.com" <mst@redhat.com>, Leo Liu <leo.liu@jaguarmicro.com>, 
	Angus Chen <angus.chen@jaguarmicro.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 3:37=E2=80=AFPM Lege Wang <lege.wang@jaguarmicro.com=
> wrote:
>
> hi,
>
> > > >
> > > > 1) With the event index, as long as the used index doesn't pass use=
d
> > > > events you don't need to fetch even index every time
> > > Yeah, I agree VIRTIO_F_EVENT_IDX could help here, but I think it's a =
relatively
> > > crude mechanism, I have two questions below:
> > >   1. Used event notification suppression structure is still located i=
n
> > >   host memory(in dpu case), I'm not sure whether used_event would
> > >   be allowed to update in the running of one virtio device,
> >
> > What did you mean by "update" here?
> I mean "modify".
>
> >
> > >   If it's allowed,
> > >   seems devices still need to fetch newest used_event info timely.
> >
> > It depends on how you define "timely", I mean unless the used event is
> > not crossed, you don't need to fetch it from the main memory?
> Yes, I got your point here.
> >
> > But basically, I meant putting used_event in a cap/register other than
> > inventing something completely new.
> Sorry, I don't get your point here. What does " cap/register " mean, used=
_event
> Is located in main memory, right?

I meant something like this.

Introduce a capability to allow the driver to duplicate used_event in
the register. And say when the feature is negotiated, the driver MUST
update both used_event in the memory and the register.

Not saying it can work, but we need to know why it can't work like this.

>
> >
> > >   2. According to virtio-spec, for example, if used_event is 0, then =
a device
> > with
> > >   VIRTIO_F_EVENT_IDX would send a used buffer notification to the dri=
ver
> > after
> > >   the first buffer is used (and again after the 65536th buffer), shou=
ld this
> > behavior
> > >   be strictly followed?
> >
> > Used index is best effort, and the driver must handle spurious interrup=
t.
> OK, I'll discuss this info with my colleague, to see whether it could hel=
p.

Or if you found a bug in the event index, we need to fix it in the spec fir=
st.

>
> > > >
> > > > 1) compare disabling via register against memory
> > > > 2) compare auto disable against no auto
> > > I see, but sorry, currently we don't have any performance numbers yet=
,
> > > but theoretical analysis
> >
> > This might be also helpful, for example, without this proposal x pci
> > transactions per packet, with this proposal y pci transactions per
> > packet.
> I see, later I'll need to see if there's any performance data based on ou=
r simulation
> environment to share.

Great.

>
> >
> > >  and think it'll help improve performance. Some
> > > popular nic also supports this feature, which disables interrupt afte=
r sending
> > > one and needs driver to enable it again. When enabling interrupt agai=
n, drivers
> > > can attach some extra information.
> >
> > I'm not saying it doesn't make sense, but t
> >
> > 1) the movitiaton needs to be well explained
> Totally agree.
>
> > 2) we need to know if the existing mechanism can be reused (e.g place
> > used_event in a register)
> That would be better, here the "register" you mentioned is located in a v=
irtio device's
> pci bar?

Something like this or other place or we can say it could be placed in
a transport specific place.

>
> > 3) or how the new method interact with existing interrupt moderation
> > features (event index, interrupt coalescing etc)
>
> Regards,
> Xiaoguang Wang

Thanks

>
> >
> > >
> > > >
> > > > > +      The driver may benefit from just informing device the late=
st used
> > > > ring entry
> > > > > +      it has processed, but not enabling used buffer notificatio=
n. This
> > field
> > > > only
> > > > > +      occupies one bit, if set to 1, it will enable used buffer =
notification,
> > > > otherwise not.
> > > > > +\end{description}
> > > >
> > > > Any reason we can't reuse the existing meachsim like used index /
> > > > event suppression here?
> > > Please see my comments above.
> > >
> > > Regards,
> > > Xiaoguang Wang
> > > >
> > > > Basically it just sounds like we need a transport specific method f=
or
> > > > them besides being part of the virtqueue.
> > > >
> > > > Thanks
> >
> > Thanks
> >
> > >
>

