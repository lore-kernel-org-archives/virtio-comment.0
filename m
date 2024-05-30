Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6737720B3E
	for <virtio-comment@lists.linux.dev>; Thu, 30 May 2024 16:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717086475; cv=none; b=kOLPQPM/DmdM+2Zwb7gudpPiYjW6d61t6wAuWf8cdiXtffh+X7r8A6ErttdQdh5kHVoZWh3slH3++7xp9iXyW51hLfWeWZiYCfY4q4+fE8pj0Ad7+2caHGcIR/cNyeps7sv2wm0UV9hJ6EVqGludPD80pUFXDl3ZjJuD+HbIjt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717086475; c=relaxed/simple;
	bh=zCf6wo4t5J9nsLyu+4sxSZlsq+01xYL38PTXrjuLh6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e90EDlXKoXgzwuJmrZ2U1841r/kkrMaC/W8+gXw/zvI8M9ImTIHZTURom4/6xfn6YmFbSPAm/htnFgkqYg4AqoKkwsPrw5hD1qGb4H/oGY+aJhv7wSDSEI1kXxjGNjOGvQh88lRec1utyiMC6/547rB7j1rctCM3otnkMG8vvsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NtHKOsqq; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NtHKOsqq"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1ee5f3123d8so137435ad.1
        for <virtio-comment@lists.linux.dev>; Thu, 30 May 2024 09:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717086473; x=1717691273; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zCf6wo4t5J9nsLyu+4sxSZlsq+01xYL38PTXrjuLh6o=;
        b=NtHKOsqqb6QVaSK6y0CB/Yx3HLKDPp/46O+JuC85s6MghDg8b83RUeOkDU5YJpAVaW
         JZ8GhOpepmjgBerDw9UrBp6TWE4innIdMsdowsB1gEfa/fWsV/IENHGKV8qWt7w1hT5O
         8Dd1tKXqIxIvdBSOWjMYtNl3MgzGkd17nFy3ODDJqfIP3ZkxSaJWrRBMEijTBKOsUipL
         Yoy4wRZRUhXlARlYLC8rik0bz1WgefmNR876QHmcK2Nh9oNjLhRQIAB0Fjpx5j0PNMa+
         FzwxIVdxrq5+EY1UxLUZ8K0RIkj86EodJz9uFYfgdszQbw4YsD5rA3IXXLiHkZb0xI/S
         VHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717086473; x=1717691273;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zCf6wo4t5J9nsLyu+4sxSZlsq+01xYL38PTXrjuLh6o=;
        b=GihDHga77SBVOT+5kO5Yvs7zbUgZq8UmDaHsXAfBB8VGWuk8ulVu5n+J03bFoKBD0U
         sBkK82K4EDdh+gYPv7fPWP38AZIvyYUVzV8W0IyZUeomOLxnrnTz5VdOqZkHD4UIDkIx
         ON+e1Bnc//c99K7/L61L7BLS8KrcU+tAIMSSYhEFa4y07pP+whi3QZL1DtFnjpJvGy6g
         Q5rt2423gXbKrumrfCE2Z7WXEPn1z4TXb4p8bWKsort2pLGg0m+Bt4AoUOA0mUGhI5mF
         3p+rdraz3cnQ3G0IDTDOBjj1mFG3UD/4W3ftDvG61QkpFTkPM+N5/6Wbl5c40kyXhMg4
         /e/w==
X-Forwarded-Encrypted: i=1; AJvYcCVkMLBzQ1e+u3ddAVQEVX6zkvbax+UIud6AiUv4GCQPOzheHJ9VQ3L6WRmbQlnwtV16OSk6lnrUY5fDTiPIBMc/C4iuLzw4g8RsQeLOE+8=
X-Gm-Message-State: AOJu0Yyjq88rSTnt6Y20IB5tyxFIiaFuzLcnbwGG2OyQVvJUlrbqOSjP
	r6KHjKxuaseuM525QnUGBSb9dd8DwsiqMGswVve7B/1HcMhptewvFC+AMw7R+97084FRdhK0LST
	9qb09cBIi187i3bMciIBm9bhRwWpAnArNKzIF
X-Google-Smtp-Source: AGHT+IHzL1w1IItzIHwBj258FSK7muRizvc0EOsljJe5Ixaz9AeK6hQsC9OgKKrMeYyYPvJ9w5qb0uQhfidJ4C/WUKc=
X-Received: by 2002:a17:903:245:b0:1f2:f6bb:e9c0 with SMTP id
 d9443c01a7336-1f61a79a4efmr2197495ad.9.1717086473398; Thu, 30 May 2024
 09:27:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cb89d3d6b6a7e4a7f13e60dd3fded5e950727890.1716448766.git.pabeni@redhat.com>
 <ed730a7e12853339c6f5f298fa6c240a39942a74.camel@redhat.com>
 <CACGkMEtetmg=YUtPW+yL+s5MzhbKKkJyrx3EDOtf2aF=q5_b8g@mail.gmail.com>
 <CA+FuTSfCm-GpLHYztQCxti2adCcFPV7GyKBH1zTDB8tM2w1NNg@mail.gmail.com>
 <794dd45767bf54385613c5d18c32ee11d474db87.camel@redhat.com> <CA+FuTSeDqrQ3FVjpmmQ31UbyGQA-fUsYz3=NmizC1U7Q8w6E3Q@mail.gmail.com>
In-Reply-To: <CA+FuTSeDqrQ3FVjpmmQ31UbyGQA-fUsYz3=NmizC1U7Q8w6E3Q@mail.gmail.com>
From: Willem de Bruijn <willemb@google.com>
Date: Thu, 30 May 2024 12:27:16 -0400
Message-ID: <CA+FuTSfi6uQUqyxUccAL8YxjFh11vDmC5uT16M41_o3QenhzwQ@mail.gmail.com>
Subject: Re: [PATCH v4] virtio-net: define UDP tunnel offload feature
To: Paolo Abeni <pabeni@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.linux.dev, 
	maxime.coquelin@redhat.com, Eelco Chaudron <echaudro@redhat.com>, 
	Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"

> > Yes, I think the ethernet-only constraint could be removed, but I fear
> > that will pose some difficulties for H/W implementation - requiring
> > extra flexibility - and possibly some additional features negotiation
> > should be needed.
> >
> > I think that the struct layout can already cope with GUE or the like.
>
> Great.
>
> To be clear, I don't mean to ask for all back-ends to offer support for
> all these. But that the layout supports it.
>
> I suppose if we want conditional support, then that would require
> extra flags on negotiation. E.g., a separate
> VIRTIO_NET_HDR_GSO_UDP_L4_TUNNEL type.

Whoops. Meant L3 instead of L4 here, of course.
