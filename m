Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674D621C9ED
	for <virtio-comment@lists.linux.dev>; Wed,  9 Jul 2025 13:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752068618; cv=none; b=HD9MdTeSrbLxrgl6ugE2R8pQSZRWcJeYxZoYFZljKH3FwA+kmwGTAYVAXj4QpZtMCTBnHlXPkFUNNh1SmB5E0NyhjoUOjKU4CQ+m/QIigSArnMgtWoVrccDKCe4ZnP5e30ZhlKe+clShKm4XufnLSp/z2ssc2wgZd6F5OjJvq9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752068618; c=relaxed/simple;
	bh=L2ael3hBk3IQsv0NwQWzODZ/s4/s046Y/H/5cNt8gfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KIQ+fKu7v+ijVdlp7UMWI/Ribno4M1IEeGs234U46cdZiBBn0x52keJJpFQOXUEaGtDkybOI2c4aZGQiSYqb6J1n6+cEG/NYYPkNpHbBwTUQWX5GZ8rE4vkFs6fQ6nV/JKe/CqBOfihXMZDssANpIdJEzW5RxNX6YcSnFD8E1iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A5RDI+dF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A5RDI+dF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752068612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L2ael3hBk3IQsv0NwQWzODZ/s4/s046Y/H/5cNt8gfQ=;
	b=A5RDI+dFVhBMgQBxd+TlRm0H8UEQYvLEBdK0r9x5aB1Fl4o/a3XW89fC6eeWo2f0oUASGr
	mwtxff3/o6GT04snZC+GJ8FowBimTYQwAtib+vU0C7JC7xNIzetesBzQiREBB9E8oh+ZM7
	WUErJXw/SchNgcDJ+3Zs/1UGtekmYfY=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-3b2Cpay_PMiicbBOd4nWaQ-1; Wed, 09 Jul 2025 09:43:31 -0400
X-MC-Unique: 3b2Cpay_PMiicbBOd4nWaQ-1
X-Mimecast-MFC-AGG-ID: 3b2Cpay_PMiicbBOd4nWaQ_1752068606
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3138f5e8ff5so5576980a91.3
        for <virtio-comment@lists.linux.dev>; Wed, 09 Jul 2025 06:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752068606; x=1752673406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L2ael3hBk3IQsv0NwQWzODZ/s4/s046Y/H/5cNt8gfQ=;
        b=FnaaPU9T/6vrhpm8rQKz8U2XXD1UnPD1Vr/Rxg8QEnoMUu+CY6KiINoeu9pOmkk/N7
         BkEwU1kOTGAmLsuEKSX1aMipG70JO7KufDtaWBgMXByDg4RFUptoqTwGhP048uTHtYXd
         Cb+tm+tBKy+tOMOgcXx4PIFXJOPMdeON9THtqJyjHdTkMD7LbZZ0pbObJYVcESswQLiz
         Ycglfy/qzPfhndAYcEjPi8eRhGa/GoD395jNfKb7fham9NCyBFkorfjq+o8HRgiRREKe
         f1m19Xdhb7D7+aWA3ogD++c8ElW7X+MFlrgmK523XGjc4/FgqM1sX8xT6rrGWJ5H2+qX
         scRA==
X-Forwarded-Encrypted: i=1; AJvYcCUifO84SnsFYG5E9YL9aszQiScNi60yLlpCOrLVo7UTtqh89VpUAhx7IwRet+pfXcY0cE62b3fEVpo96ntyLw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwnmOEZcDEbiYzELuFPBlPfqZezHKXmwjQ3svpHMt3LRtU6YR/D
	i6q72JlUtTnpn7k2kxtQmX6LiL6Gs8qqoTDCD4g8Ot8xH4BGWwocRLor8Kxvm9HTgg+ceRJNEV+
	XLaIdQp7eF1Iz13PJlZSRNDp63Jzvb0UjETd295/Lh32zWVoy/EpXe0mhB+iCco+slf2gW743WJ
	eqzLfKFqGcANCnbxcObfUmbqyUdenRFzEBDnUGSiXBuYE=
X-Gm-Gg: ASbGnctlgcQWawwA2vSZbPiPYgzOeOgp3zPa7pCplsNPhp3jiiTLoWb/1C0ckQYp10y
	6w+K8dYMZ//Qks9ciRiHKLDcClK+wTxixQjt2+Mqf574GORjsgdPLOPYsb3qaOYFzKHo3Ulrf0G
	nZyeY=
X-Received: by 2002:a17:90b:3ccb:b0:311:ff02:3fcb with SMTP id 98e67ed59e1d1-31c2fde5a55mr4257855a91.28.1752068605787;
        Wed, 09 Jul 2025 06:43:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrflJu2Q6L+kNEd+xpJBWEaYPMwfmFP5CLPLTKm3V++gJLemt+0frJ2Vwh0QwzpEZXdsCskKdyhG9LlHDwcv4=
X-Received: by 2002:a17:90b:3ccb:b0:311:ff02:3fcb with SMTP id
 98e67ed59e1d1-31c2fde5a55mr4257800a91.28.1752068605391; Wed, 09 Jul 2025
 06:43:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250304130134.1856056-1-aesteve@redhat.com> <20250304130134.1856056-2-aesteve@redhat.com>
 <D8G0UC5KFCYY.32BN79B9WOK33@gmail.com> <CADSE00L_ZGgqXYCttwGqD3ceBBaZaSVnPi9n6A1O+CyPBJe8nA@mail.gmail.com>
 <87a55dvhfa.fsf@draig.linaro.org> <CADSE00LPw5hVzx0=rqwcc4AfJ3Eo4DXLfcy7x4LsVQMgRZocTg@mail.gmail.com>
 <CADSE00+gAfgCz0N8ceS2kdZkvEF6=nBHEghrmm8eXfuyZ10_Mw@mail.gmail.com>
 <CADSE00JOBEqiFjAioJxf-PAB-FfSSy+1Z8WMuU9ktyf=dk-1TA@mail.gmail.com> <CY8PR12MB71956781D048BB39A9CA97FFDC49A@CY8PR12MB7195.namprd12.prod.outlook.com>
In-Reply-To: <CY8PR12MB71956781D048BB39A9CA97FFDC49A@CY8PR12MB7195.namprd12.prod.outlook.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 9 Jul 2025 15:43:13 +0200
X-Gm-Features: Ac12FXx0crmr95u3RUEnmLmX-ea1okRc6ovXFkc4sbnRZIQmomU_iILV731lPmE
Message-ID: <CADSE00K7u7E_-joM1mys=sczH+kK6PZt7H=j_302cRoeYMhPqA@mail.gmail.com>
Subject: Re: [PATCH v8 1/1] virtio-media: Add virtio media device specification
To: Parav Pandit <parav@nvidia.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Alexandre Courbot <gnurou@gmail.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, 
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"adelva@google.com" <adelva@google.com>, "mvaralar@redhat.com" <mvaralar@redhat.com>, 
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "mst@redhat.com" <mst@redhat.com>, 
	"dverkamp@chromium.org" <dverkamp@chromium.org>, 
	"gurchetansingh@google.com" <gurchetansingh@google.com>, "changyeon@google.com" <changyeon@google.com>, 
	"daniel.almeida@collabora.com" <daniel.almeida@collabora.com>, 
	"agordeev@qti.qualcomm.com" <agordeev@qti.qualcomm.com>, "eballetb@redhat.com" <eballetb@redhat.com>, 
	"ribalda@google.com" <ribalda@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pwZw-T2gbzw3z-dhgjFu77YGN-FOTYtJgXbyiC9yod0_1752068606
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 9, 2025 at 3:29=E2=80=AFPM Parav Pandit <parav@nvidia.com> wrot=
e:
>
>
> > From: Albert Esteve <aesteve@redhat.com>
> > Sent: 09 July 2025 05:48 PM
> >
> It was simple editorial conflict due to rebase.
> I merged the change.
> Please check the 1.4 branch if everything is right.

Everything looks good to me. Thank you!

