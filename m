Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3D076035
	for <virtio-comment@lists.linux.dev>; Wed,  6 Nov 2024 04:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730867604; cv=none; b=HDTUChcqXnW3sap452FFOn3e30AC3knYvCsuuqljz8ZxfWchiU1jBclw7u10Xjn2IAo4plliFWo4GNRfU/tX3Df5+6B8yRp+DgcTP1ef7sZxUXb68dp9xJiT9TTIOtHUrV8rB3/Q+WRCn80Y5q5xxBOLsLbk+f/hqLrWzbPSTuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730867604; c=relaxed/simple;
	bh=MsiygJCKFwXaLpQ9vg4x2YrML+qf+HZHAisy3TYRd74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GKsC/dkZF5u10CA6IRmyIE8EcSaPkKCzSIudO9jPOtbcIMxY4IzoiQZ5z/GAWjENP2NxmtTnzU6IF6knX4aPCCQvyE6tcVabR9UuxzeD+GYFUpgbaS7/1qBlb9jr2xuh679krfKoHVorWxj+semJFCVHRkb8j361s0+LB24byPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KjluW+0a; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KjluW+0a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730867601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MsiygJCKFwXaLpQ9vg4x2YrML+qf+HZHAisy3TYRd74=;
	b=KjluW+0ahvSKtPoeXS9pXy0CUGdwtQWUGBX1gsFW6yqZSFBJhEVlp6AeKsHZqw9K42PCgu
	wlVbz6+AXF2lKTWW2eVJRvmbYQeVAlMLWuXUhvH22MQG1T/P5R5N9zwvPe6lLPv+eWgbzO
	KGkczC2WaYf2Yh9Fz7B+T1tVSMzHGms=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-0VEeNIuIOuC6-5zxN4wQUA-1; Tue, 05 Nov 2024 23:33:19 -0500
X-MC-Unique: 0VEeNIuIOuC6-5zxN4wQUA-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2e2c3338a9dso7826521a91.0
        for <virtio-comment@lists.linux.dev>; Tue, 05 Nov 2024 20:33:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730867599; x=1731472399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MsiygJCKFwXaLpQ9vg4x2YrML+qf+HZHAisy3TYRd74=;
        b=R3ugdEnw4RdTYpt2BNK1YqEm87nG2bjN5WWGNEgkjAmDWZl5qGe9m1YhvmPr71Qx6d
         BkzHcOTAs6jL0Yz3SN5TJFJfLTMBVbcM5PFskWCy+ju9OE8XXq9ZnzBQlWSUZ27S9nvM
         mGsfSTB/v/bd4YXQw6DEtB7uO8oyA8aHbE0F5Vnsn+a45CJBZfzTZio7efSJFLNHErfz
         VrXYCACDfFfre+Wf02El+4dsnnh9Llq2G2/yeHNKniuc1D1Y/EmfSxoUGnBWHqo1+zvl
         QHQBOE0wcLg2Anq6++eRSYl2d7/N7OE4/D4Bro8XeF+sIN5PDOjHQkyPom7Lelrn45Tj
         k1RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVObzCYVyte60X3j33tg6lctEjq6/XIqz461G5a6yPo4XNFikxJNsF/VIZYnrip/6qT99Shxwt5bM7MF6ttqw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwczC9/3OR8s9K5yIZKEsIbepCC3WbQgfKnTyfAGMRvT9UVmZlU
	Pl4RNxJ21mLDQ5Io60d3SsOt2yXxv3Fgf9xsx3uxm67ctyOMA3YG8NIVSddfXem0hXrZmboD/HV
	ABiE8lRUFzcTgDYGq+Hjzn5twuNxBm0bMssIsqv2evYgTv3bBhxcezzCXZHwmMmGP6094yabmkr
	5l7SQ63dyNzF4YD5yrp+6eDvsPYfh20fIYosuNsn0=
X-Received: by 2002:a17:90b:2703:b0:2e2:bad3:e393 with SMTP id 98e67ed59e1d1-2e93c1239b8mr28309316a91.3.1730867598794;
        Tue, 05 Nov 2024 20:33:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZT1ZNeLkABRXEn4pGv3wyIUBUyfGm9OoUgUcP+KEVvdH8e3Ol5sk+FHjinFMzMwCC86NTab1LnxWksUo3Xjo=
X-Received: by 2002:a17:90b:2703:b0:2e2:bad3:e393 with SMTP id
 98e67ed59e1d1-2e93c1239b8mr28309296a91.3.1730867598371; Tue, 05 Nov 2024
 20:33:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240701034435.675-1-lege.wang@jaguarmicro.com>
 <SI2PR06MB5385346C86CF45806EC6E9F6FFDF2@SI2PR06MB5385.apcprd06.prod.outlook.com>
 <20240705035755-mutt-send-email-mst@kernel.org> <MW4PR18MB52443417B7398C64244F838BA6522@MW4PR18MB5244.namprd18.prod.outlook.com>
In-Reply-To: <MW4PR18MB52443417B7398C64244F838BA6522@MW4PR18MB5244.namprd18.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 6 Nov 2024 12:33:07 +0800
Message-ID: <CACGkMEsrtZ8Cwby-K9Dynn5-uXu68m2s+bBEdXGW7KrxjfvcUQ@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [PATCH] VIRTIO_F_USED_EVENT_AUTO_DISABLE: add new
 used buffer notification suppression mechanism
To: Vamsi Krishna Attunuru <vattunuru@marvell.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Lege Wang <lege.wang@jaguarmicro.com>, 
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>, 
	Nithin Kumar Dabilpuram <ndabilpuram@marvell.com>, "parav@nvidia.com" <parav@nvidia.com>, 
	Leo Liu <leo.liu@jaguarmicro.com>, Angus Chen <angus.chen@jaguarmicro.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 12:23=E2=80=AFAM Vamsi Krishna Attunuru
<vattunuru@marvell.com> wrote:
>
> Hi Wang, Michael, Jason,
>
> I wanted to follow up on the previous discussions regarding this new used=
 buffer notification suppression.
>
> Since this proposal involves two changes, how about separating it out and=
 explore the feasibilities to support interrupt coalescing with existing op=
tions.?
> 1) Support pvirtq_event_suppress/virtq_avail in PCI bar
> 2) Support used buffer notification coalescing
>
> Regards
> Vamsi

Maybe post a new RFC to see?

Thanks

