Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473C7189F56
	for <virtio-comment@lists.linux.dev>; Mon, 16 Jun 2025 08:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750063128; cv=none; b=Mk2s+gIodKCjcVCefDB1D8ouXmclfoRka8uM/wmD8Tc1w/FDf+ypF3HHDymw1eAD/hTGv87KD1bQAZamEKleiKJzcF//TTBCktd5phJIea6rssyvncIPNdp0ltv274tYSfLmKK2rajfllipXaupzwcNHBFSR7x/peY5XGZwlxZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750063128; c=relaxed/simple;
	bh=g7zPkIMA4ZcZ7SPnPUlB+Y0Fd6eXeT/LsFBjcWnqKkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Heb3dC6qQKiY8AA3NZBL/n1qn3n37hOjYl7T0Npo38ANUW2/xmnu8OSQCVW2kgbClTAGrUVXSktFuVpS7G2OowaxfY90UQSthW/ItAEIG+1eT7yP4+hpNxU6GeMiBtIi6yS8S5nV41ex6KHZmUWRJqNml+nPRR/fzRuewi/ikvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VhbLDLXI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VhbLDLXI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750063126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g7zPkIMA4ZcZ7SPnPUlB+Y0Fd6eXeT/LsFBjcWnqKkA=;
	b=VhbLDLXIdkwxvyE6DOwmgy8I24Hyfzttv7+Uvs5FGdSO2X4Ctg3P7x75jg1SPrKSvKWEV0
	ejFp1fQNZTNJADbj5YZr6CnWfpNtJVOefM+fGvWwjOVI8KdikpD65ORezfOWkg1H/a9P0K
	Eeg4uS3WtvrQXuoCDPjk0QcDfSUJ5bQ=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-qTBunDV_Pr2yuQ3ltqTPZA-1; Mon, 16 Jun 2025 04:38:44 -0400
X-MC-Unique: qTBunDV_Pr2yuQ3ltqTPZA-1
X-Mimecast-MFC-AGG-ID: qTBunDV_Pr2yuQ3ltqTPZA_1750063124
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-e741f4a7585so5229970276.0
        for <virtio-comment@lists.linux.dev>; Mon, 16 Jun 2025 01:38:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750063124; x=1750667924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g7zPkIMA4ZcZ7SPnPUlB+Y0Fd6eXeT/LsFBjcWnqKkA=;
        b=UmlTKnU1Y3byElzqiWPcZ1B80eOguo39cMoYN4fuWINlqxbBpLuq1NJTvwUDiD/X4T
         cuoQkRpHIRFBdRSktul/kxSuNee/CXXOx0Nx32QvMbknIZ/aRG6Xjdxmvv1BGUZEDhH5
         hMk80LYCeiC6NPHR1Zrqo3N9GbP0XHniICnWPwjNuI8v6x+ZjS7NjMXBD2ZLQKfeCTjr
         gr1I+ngEVwqN8aEzFiqL7Fa5jZ3CLvPU76IjomF2j0AsZ0rNesOttK59q/nFnvDi5u3+
         k8NOefmNESF1xAjEBSvr8kMTbolJgl4NpL6nsW9oHow3BFfobV/pBer3RsG4BsoT2YPR
         GKpw==
X-Forwarded-Encrypted: i=1; AJvYcCWApV57ratFg/4WXXTe3gYuvlP/wg8fCK9i4j9LVoqP5ABaR2HUu4bQCBEXaQTri47g+SOOR2iNFs93FoI6MA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzMRw4GZ57YmsVE52gWAPwb532xFIyJhiLOCXtkIu1j1o60RG1y
	eUbtcjHT5Cllj0JfaQQESsJpSwK1c2LEbPDpETO1c/8K+IfAZRviB9DKnVODDrqdbY/KTTRKOAi
	0C5XPwntEav7Klafg2CIfn1Y5wjxJORjzDAofR3XsHyp2A6XFdgcIvqbO7bI+YZVKZszoluztn7
	rtVogIRfD2YNpCxruOhfU6wjcKWEPrCMrKC+hvHRK0d/o=
X-Gm-Gg: ASbGncu8hcdH8BxMfw49BLUnE685Mo8YMWqY2Cpcxx4fHQiOl4eF1NBmvhOCVfiwwwt
	NghY5Ij1lfNfK+koc+JhWIzHAP33R58PNKEPpIhFkRkH+rEft7TvKr7trT8UHXH4iXiKAWfU4m4
	iViB3x
X-Received: by 2002:a05:6902:20c5:b0:e82:3db0:4e84 with SMTP id 3f1490d57ef6-e823db04ee2mr8971251276.39.1750063124060;
        Mon, 16 Jun 2025 01:38:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPfJv4pRJ+yWQQWKIvOO6aPJJKXqzPh12tpgCmun2OKjpjCc8FLtLMLwhkIzH6u3gj91khXZ+LVD4hPRQft1A=
X-Received: by 2002:a05:6902:20c5:b0:e82:3db0:4e84 with SMTP id
 3f1490d57ef6-e823db04ee2mr8971237276.39.1750063123720; Mon, 16 Jun 2025
 01:38:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACGkMEuV41G8S2gt=HozCK5GR6fv-QSChscR5TsG2HLO3H5FUQ@mail.gmail.com>
 <20250616082914.1159976-1-niuxuewei.nxw@antgroup.com>
In-Reply-To: <20250616082914.1159976-1-niuxuewei.nxw@antgroup.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Mon, 16 Jun 2025 10:38:31 +0200
X-Gm-Features: AX0GCFuGM5znXKU-VyISbmhJh7uTT6nr_3c6c_lXEA04U0csyg2fhEfppFNzths
Message-ID: <CAGxU2F4fjuvPK_4tU4-Tm0mYg3Rd5AhL6uaJmCmSTRzaqzAr6g@mail.gmail.com>
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
To: Xuewei Niu <niuxuewei97@gmail.com>, jasowang@redhat.com
Cc: fupan.lfp@antgroup.com, mst@redhat.com, niuxuewei.nxw@antgroup.com, 
	parav@nvidia.com, virtio-comment@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SNJMC3cKPWUnsOejW0gTcD8ECcnSyPa3hqZtRM388qg_1750063124
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Jun 2025 at 10:29, Xuewei Niu <niuxuewei97@gmail.com> wrote:
>
> > On Fri, Jun 13, 2025 at 4:46=E2=80=AFPM Xuewei Niu <niuxuewei97@gmail.c=
om> wrote:
> > >
> > > > On Fri, 13 Jun 2025 at 06:57, Xuewei Niu <niuxuewei97@gmail.com> wr=
ote:
> > > > >
> > > > > > On Sat, Apr 12, 2025 at 10:39=E2=80=AFPM Xuewei Niu <niuxuewei9=
7@gmail.com> wrote:
> > > > > > >
> > > > > > > This patch brings a new feature, called "multi devices", to t=
he virtio
> > > > > > > vsock. It introduces a "VIRTIO_VSOCK_F_MULTI_DEVICES" feature=
 bit, and a
> > > > > > > "device_order" field to the config for the virtio vsock.
> > > > > > >
> > > > > > > =3D=3D Motivition =3D=3D
> > > > > > >
> > > > > > > Vsock is a lightweight and widely used data exchange mechanis=
m between host
> > > > > > > and guest. Currently, the virtio-vsock only supports one devi=
ce, resulting
> > > > > > > in the inability to enable more than one backend.
> > > > > >
> > > > > > I wonder which part of the spec forbids more than one device.
> > > > >
> > > > > No. The spec, however, is designed for a single device, and lacks=
 some
> > > > > specifications for multiple devices.
> > > > >
> > > > > For example, we should have a mechanism to select a device from a=
ll to
> > > > > communicate with a peer.
> >
> > I wonder if this is a:
> >
> > 1) mechanism that needs to be mandated by the device
>
> Yes.
>
> > 2) a policy that is allowed to be tweaked by the user as TCP/IP did
>
> Not allowed in the current version.
>
> > (Note anyhow the driver can override what the device suggests...)

I think we should follow what we described in the spec:
"The virtio socket device is a zero-configuration socket communications dev=
ice."

So, IMO the guest (driver) should not be allowed to change anything.
E.g. Right now it's not allowed to change the CID assigned by the host (dev=
ice).

Thanks,
Stefano

