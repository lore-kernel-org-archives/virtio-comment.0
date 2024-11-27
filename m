Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE8F38384
	for <virtio-comment@lists.linux.dev>; Wed, 27 Nov 2024 02:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732676055; cv=none; b=PsvkPFOeOIkkJIQZd6twbGihpw0J4USr3gkeWZVVaN8I58ALNQKmebJ8GxsznXld7Hv+sQNRqmcQHojbOzABs8pkp9Q+CTJ3aeMyTN2e2uAtEoXwspn3k4U1/myPLHHIXJi7yBMqBOWvrTsGmZ8v/p4LpY0p8nC1gudtUIPWgD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732676055; c=relaxed/simple;
	bh=9V5kWzQsu1gKmy5j2Dq1xTlNFWXQJbBnr1Cuy4oJzdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HEmKbegAA/pAdFrivgtecZlN/qtXICqU/SK0WVc6TPoy+a41ZIVokLrB7L9xfUPDHW7FFemTdlFAwDBC2Mg45TEP0YcDEg0mXYW5GZI+F5qp9KA/hzEUqPOKjO6fNp4ywdXR9BOKEcI/zXAmLkA5XDiYKy6vojHwOOPaqkbAwhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HGYdSDpS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HGYdSDpS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732676052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pVUam3byrpZAGzJgqmMi6d35BlOI7aglxnEl7oiM2sE=;
	b=HGYdSDpSzPr9sa+h2dZmcYMC5Qo/HlkRyenw3J5TTxUeMt8vmXjL4J1Af70eCcDDgjvLi/
	kSSnx0No51y/mZ/WscX97Ni9HrBs1x7Nzh100af8/RQu1rAQ0nd7cl2cZpZNjkgvikYVC3
	Ctx96Lb9yyWDoiCDPZqW6QQc7/Uq4Fo=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-9SWnvdOaOaSwXRL4iXksvw-1; Tue, 26 Nov 2024 21:54:10 -0500
X-MC-Unique: 9SWnvdOaOaSwXRL4iXksvw-1
X-Mimecast-MFC-AGG-ID: 9SWnvdOaOaSwXRL4iXksvw
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-7fbde8970d9so4190030a12.0
        for <virtio-comment@lists.linux.dev>; Tue, 26 Nov 2024 18:54:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732676050; x=1733280850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVUam3byrpZAGzJgqmMi6d35BlOI7aglxnEl7oiM2sE=;
        b=PIbhz09Av/47z7/mLKJ9CSbga6sV79ZWYyM693rPT81EaUZhA5YwxTmS7Xsm8BeNWV
         75or2u5YuRnDXitux0HA6PPZMk3ReqrOMSrITumyuh45f+HrIF70n3SOki2KIWErSPNM
         ONZFsM2nilmqyeZxLE2tgNpwKDcSiWPUgLyebbjCEBK/yx+Ohw3SwGVaRjv7UJGQ3CoU
         5l9BfdjhVn90tMHFFgm7AUCaz2dgq1KBTtKvmKtt4qjKNlUH9pUhy9HrIPHTbJTZkYb1
         HAhcVsgTdRGTPCVPRHzE1iXq8/LniwZ8KvmvI0Y8TZPMdQkAGtdflnqxUtp3TT+1T45M
         Lotg==
X-Gm-Message-State: AOJu0Ywk7GejBNVzPwJjxaW6O0LbpVbFeFgvE6A+BxsKEoo3h3oOyR5A
	tM9pnYFHiULRqocGNJZLxO2HdVqTQ6+DhF7qZ6yWB8vMCs3O4FanDwGzVLRcDvnDBEbCmyIbyye
	E4neWc9sx+skNUuxm+mwHnYkogNst86z8a+6MK8f1iXWeKwFCB/2ch4aVP8Nf08Ume1wRbseHnR
	itt+eVF0ZMFuyzgP4R7ApQ/CDZ2tAD0FUOJ3lD4jY=
X-Gm-Gg: ASbGncvjz+C7kdi/VLqWoGVAi8EQU/46h611MYxFvUK0rsboH2eg+QI1vxH4T9v5Sc0
	PxnMtex4SuTAIZXQouEoijNyK+xxXs+SF
X-Received: by 2002:a05:6a20:9185:b0:1dc:790e:3bd0 with SMTP id adf61e73a8af0-1e0e0adbaf6mr2769400637.15.1732676049899;
        Tue, 26 Nov 2024 18:54:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUaFwNB+ysO40iwfpSPXhpi2OtB6Ppw1XH2KQhJ+bIxA1/HDk1PJdSBvO7dJ6YdN1POYYqnBBbK7uXrnVNjYo=
X-Received: by 2002:a05:6a20:9185:b0:1dc:790e:3bd0 with SMTP id
 adf61e73a8af0-1e0e0adbaf6mr2769375637.15.1732676049482; Tue, 26 Nov 2024
 18:54:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1731084277.git.pabeni@redhat.com> <4a81d0cac760abddfdeeb71da4c42ee0ba83cc4d.1731084277.git.pabeni@redhat.com>
 <CACGkMEtR62pqGA9fi3np7fmpexq6F1MAx3XD2s0bctKKSofrug@mail.gmail.com>
 <88fa80f1-d82a-49c8-b933-7621d24b15df@redhat.com> <CACGkMEshn+s75cRO-_AxpErMisQvewVoG7dr2cr5tCgiP5zamg@mail.gmail.com>
 <8cd6acf6-278b-4cf5-8b88-789cd5f25652@redhat.com>
In-Reply-To: <8cd6acf6-278b-4cf5-8b88-789cd5f25652@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 27 Nov 2024 10:53:58 +0800
Message-ID: <CACGkMEvKgKm4W8bO_wiECarqdFmgckgR=L2B1saDzkuG-+zUXA@mail.gmail.com>
Subject: Re: [PATCH v10 3/3] virtio-net: define UDP tunnel checksum offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com, 
	Eelco Chaudron <echaudro@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Lcec8GLnUWs9UmFpaavPQ0SEaiOM-1IR2kligdy7rZ8_1732676050
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 11:37=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wr=
ote:
>
> On 11/26/24 04:07, Jason Wang wrote:
> > On Tue, Nov 26, 2024 at 12:44=E2=80=AFAM Paolo Abeni <pabeni@redhat.com=
> wrote:
> >> On 11/25/24 04:41, Jason Wang wrote:
> >>>> @@ -926,8 +1003,11 @@ \subsubsection{Processing of Incoming Packets}=
\label{sec:Device Types / Network
> >>>>  \item If the VIRTIO_NET_F_GUEST_CSUM feature was negotiated, the
> >>>>    VIRTIO_NET_HDR_F_DATA_VALID bit in \field{flags} can be
> >>>>    set: if so, device has validated the packet checksum.
> >>>> -  In case of multiple encapsulated protocols, one level of checksum=
s
> >>>> -  has been validated.
> >>>> +  If the VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO_CSUM feature has been ne=
gotiated,
> >>>> +  and the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit is set in \field{fla=
gs},
> >>>> +  both the outer UDP checksum and the inner transport checksum
> >>>> +  have been validated, otherwise only one level of checksums (the o=
uter one
> >>>> +  in case of tunnels) has been validated.
> >>>
> >>> Not a must but I'd suggest making this an independent patch. (I meant
> >>> the " (the outer one in case of tunnels) has been validated." part).
> >>>
> >>> Or after some thought, maybe it's just better to leave it as is. This
> >>> means let the device choose which part has been validated:
> >>>
> >>> 1) more flexibility that it allows the device to choose the level it
> >>> can do the validation
> >>> 2) no need to worry about the migration compatibility
> >>>
> >>> But it would
> >>>
> >>> 1) complicate the implementation of both the device and driver
> >>
> >> Note that offloading the inner checksum only would be quite useless, a=
s
> >> AFAIK no OS as support for such a thing on RX.
> >
> > Yes it is, a small concern is that it might be too late to do such
> > clarification. Rethink this, I think it would be still better to have
> > a clarification like this.
>
> I'm sorry, but I'm unsure what exactly is the clarification you mention
> above.
>
> Do you mean moving """(the outer one in case of tunnels)""" into a
> separate patch?

Yes.

>
> I'll do that in next revision.
>
> Thanks!
>
> Paolo
>

Thanks

