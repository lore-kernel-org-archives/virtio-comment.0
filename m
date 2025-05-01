Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A631BF37
	for <virtio-comment@lists.linux.dev>; Thu,  1 May 2025 15:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746115085; cv=none; b=n7WFkGVzU8nAZNq5MJRK5jtV3Q6ge9Itxh/Wz06Ui8KP7LL+5vIUHbEHk1ZKIBQjhdyYytsqoPTr3vmlCykAHLBHA6ECUE0T8n+hXinNhhHwM4Z39ySz5Hf9dDdJXnSBFdHUknkiF7oVFserALgsw+hUCRD/shhjuFlC1f8gKs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746115085; c=relaxed/simple;
	bh=ycddAOLv1f7NQQOP39CohOIR79DMQ6U23CxYPEN/k8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZU2YfXlAeQf571feuPKJ+keNKIheQZc65GZ+rGkAsApe1qJisjL4mTNrApBHTJg08ZWjA45nqsR+U2bfQGr8yWki/gngHF0VYDZE+PDbG5K1k7Gs17y5ysY0PCrqhN9LynoXH2pYK9JTmPIJngdFKEhnXSgcuycck+kV7XPvEX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C6wsIgQ/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C6wsIgQ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746115081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/8v1sNqAfhzjRrVWfFEEdZd5G/Eu8iCn5MPjIWZr/To=;
	b=C6wsIgQ//TgWqHdXWYQ09KiAEn+CdoJRTVQb4RnbBvCp40t9j5mb5Zl7ECSHA4xOr4PG3J
	Z/CGj1KGy9zibJxT9C67ANmQuaGYuGagFS7Z7v0/Z50/1jhMq4XZF0kfEqLaNY2gsEs0JE
	vnVkACNRxKq6ddf4+iJ923Xdw0lWYXs=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-KSby-gToPmS_DoEUrYoGCg-1; Thu, 01 May 2025 11:58:00 -0400
X-MC-Unique: KSby-gToPmS_DoEUrYoGCg-1
X-Mimecast-MFC-AGG-ID: KSby-gToPmS_DoEUrYoGCg_1746115080
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7075bbaa916so16057407b3.1
        for <virtio-comment@lists.linux.dev>; Thu, 01 May 2025 08:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746115080; x=1746719880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8v1sNqAfhzjRrVWfFEEdZd5G/Eu8iCn5MPjIWZr/To=;
        b=qLpYuMsPI4uBW/aZbS1T1+3XuTRZq3eIa3kfK+wUX6zDt9dmX/wJ6yIt9qU8MJw6hq
         snd3st/i+VSJohsxNfIz7WdF5/xVwujnQX0tLrQFpAre7PGVNv1qfWem60/kox2LJ0yX
         NBuYrixbl6Op+ja91hBmBppXj10AzmSTaeoubhgJpY6DIad0y1gsmjYPBmTVx/G2vqDP
         kh664MGLtT7GUp7HHuhv2aeez9RInTg6F+CcWnKSefwdygZLQuSvdNG4z/NsM1FyKcNG
         +2OwyjF1BFLIfrnDBXuhWUAmBzqoeyAn8DIGxOANIob/S96mgtZSBGZ77MPAMwxA/uXe
         FibQ==
X-Forwarded-Encrypted: i=1; AJvYcCWo7O32XjW3y/027inwJuS24/vggWHF8Ricv2B8a0JhQYnz8cxby8U/IcH+eL42iBpsHXpYnT48yjZsNL+3tg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxmL+A1CiQOWwlwS7wlPdaKnHsuG4Cgc+Xztx9C4H8OhXHdcagR
	f2SHBAuTt/P3aGDNaUtcFN+HJg4wMFl3SQEL3szGhZhJ7OmBcsjpa2vmi4rA7G69s+rzPr1Lnuv
	8KscICjkCSj4kq/l+Vyhf48cz9M6p7j+Lkbkh1BQlhMCZVTNZ9tiyKW6wh4qryq5GveZ3aX545a
	OowoCrwkKPj4EzUsg1a5XPXVMmixyGnNltA4ztmbs=
X-Gm-Gg: ASbGncsz1LEpLyGbMb3yc9oVbMaGk3MWZDfAD97BBbgrZbTN08aXfu88U7j4oanf/lD
	RewxwvQI60ZpEXyh756o48w1zXaXd0i2/GTWd/BLaodL3bomzW1rpe2E6OZFdAC5lC5UZ
X-Received: by 2002:a05:6902:1ac2:b0:e73:657:6c47 with SMTP id 3f1490d57ef6-e7403f290bamr10742676276.10.1746115079904;
        Thu, 01 May 2025 08:57:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFD08rNOzaUgRipQATVIFWoeEQBctZYjLVbQj+La4Oxs0BV1XK+pFmyvkfnTVvH2xY5OvCbdSPtdSOt5J48Rzs=
X-Received: by 2002:a05:6902:1ac2:b0:e73:657:6c47 with SMTP id
 3f1490d57ef6-e7403f290bamr10742638276.10.1746115079597; Thu, 01 May 2025
 08:57:59 -0700 (PDT)
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
 <68c4e73a-fa9e-4e2e-8c38-ed4a322bf47e@redhat.com> <CY8PR12MB7195E87CBF30EB5C7705835DDC832@CY8PR12MB7195.namprd12.prod.outlook.com>
 <20250501093933-mutt-send-email-mst@kernel.org>
In-Reply-To: <20250501093933-mutt-send-email-mst@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
Date: Thu, 1 May 2025 17:57:49 +0200
X-Gm-Features: ATxdqUGfaF-P8OAjUInWQbHmVg1bM8cydmDhJkPtq-9USQS--sqza2ukPO0ZGo8
Message-ID: <CAF6piCKEqzpGPorpbT7_GqN38m7h_aLGzj+=yBeFyaq2+qZV2w@mail.gmail.com>
Subject: Re: [PATCH v1] virtio-net: Fix to avoid using reserved feature bits
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"mvaralar@redhat.com" <mvaralar@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Willem de Bruijn <willemb@google.com>, 
	Daniel Verkamp <dverkamp@chromium.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iaCgifFMupxHkTEjlOJJxEy-GDJZOKI2obi_ITU-84c_1746115080
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 3:42=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com> =
wrote:
> sorry if I am unclear, I think it's too late to move RSS really. It has
> been out there for two years. The reason we can be reasonably sure no
> one implemented the offloads so far is because the set offloads command
> is broken and no one complained.  We need to fix them in the spec,
> current one is broken. So the tunnel offloads can move if
> it's convenient.

I understand the argument WRT RSS. I think and hope RSS and GSO over
tunnel offload can follow different paths: I would opt to move around
the tunnel offload bit in the reserved range (and possibly make a
little more room there for other future features).

Cheers,

Paolo

