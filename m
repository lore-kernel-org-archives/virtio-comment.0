Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD5C5588E
	for <virtio-comment@lists.linux.dev>; Mon, 16 Sep 2024 08:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726475725; cv=none; b=jQzPwIYsIrGP5gG6eOf1UeHD+T+YBngmo0mFiiamE4tLV4lrvhOOI8fB+ceMRrg2kJrdatFOU5Txg085aSMih4SKnE0fnnbzU+UdGxrcvn2dhnuRZHVuaLpyWl4IYxOVK0/iSwVhUahkdFQvloU4Ed2C6vPtZFJ0XpcIeyoeHoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726475725; c=relaxed/simple;
	bh=b1shmZPiSZDo+0TcIjUh+Fek8+6b4jEU0D8NZ2VFIr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=n8uqmNXl8TbQ3BinXG8qCF7DKOVpPwE5RJ8YyJa13zneXHs8J3lLAvm2Ik0k+d2MNB7l6uYDaKBUuf0Hh2R5d87Z8C1Hnd38PhMPorBTnq2inaU7nSXQ0obHYyetocA5WV0G/2Ocuk8EiDBmrume4DL5+H8WXrbE4TfGfqXJBIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ty9JEgpa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ty9JEgpa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726475722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0h8Cw+8Zw6BBiYgn683zvTa+aHp5DHJNdMX/xznJ3fI=;
	b=Ty9JEgpa86QwKQMoIB6nNzyW7zOQPj/rJrfO2TTGKEWQSzZ7lGVX2k0Xzmdf/Hn3ywF+my
	Yf3SN0i3C1itXiHAKhmfPD6LFHtOxBLlY4ueiCKXvqFQpgn3lcYGxltzZ8G6+WTm4MRpwO
	ELtHVC/s8hqaongH3xp+RZGRLscZTMo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-AM3FZFC-Npmzay0NCGAVjA-1; Mon, 16 Sep 2024 04:35:21 -0400
X-MC-Unique: AM3FZFC-Npmzay0NCGAVjA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42cceb06940so29209175e9.0
        for <virtio-comment@lists.linux.dev>; Mon, 16 Sep 2024 01:35:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726475720; x=1727080520;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0h8Cw+8Zw6BBiYgn683zvTa+aHp5DHJNdMX/xznJ3fI=;
        b=Q102Uq/ZzUxWYDVKgSi7TmjN9yCA5wcX9sHhCPZIKX9cqFLz/Wlid2nh8zH17vcjUI
         q9uVnAZ5tmduUnxrBULK+WEBO/2mIF8ep6okFbcf74LByCqT9Py9dTgzmOMrCekNyQsC
         7xCjyoKGkWO7hSH5+qO59GfURMbCd/vZ6NHSK41CnZp5pfg+xxaV31VWoTRYo8SSFVzs
         O2dgdZOItnMFGvEsNUa5IScwO3+HN1FSN4yZyijnjR34tdpwQKKLy86gOuIaazl9T1xJ
         wPCF0pXUlcfuQIyjb86rGcFHcTfC0pVEx0nK+pPhtYo/+JefU84lrCcv3b4+EKFCxVLt
         oHNA==
X-Gm-Message-State: AOJu0YyJATPMTmLAVmejSi/+46rri9HxU96a0NX8IV7D/JH5u3mljYgH
	IHOnbZ+jmaDAb1v6QZCXZzTkLL+D4umTDUG4aRdds0qkhLuRYG+eZtaH7p0eobwzLD9oHpzU5PX
	vO7Fma+h8fFCJ6Ol0jhoShDifuA2UeOiwEe4YJB+EveCG4cfpE3ybQ6vJjL/kQ9QK
X-Received: by 2002:a05:600c:1c88:b0:42c:c1f6:6ded with SMTP id 5b1f17b1804b1-42cdb56f049mr114231055e9.29.1726475719665;
        Mon, 16 Sep 2024 01:35:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLX4Dpehu9SG4QZK+059NR3G2yspUIdzk8DBnMMNSNoqdNQlzPFKqVsNCWBFr9TNftXB2tYg==
X-Received: by 2002:a05:600c:1c88:b0:42c:c1f6:6ded with SMTP id 5b1f17b1804b1-42cdb56f049mr114230655e9.29.1726475718845;
        Mon, 16 Sep 2024 01:35:18 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1ec:9b4:46f5:ba16:343e:7485])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42d9b15c435sm104810245e9.23.2024.09.16.01.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 01:35:10 -0700 (PDT)
Date: Mon, 16 Sep 2024 04:35:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Subject: Re: [PATCH v1 0/5] Assorted editorial fixes
Message-ID: <20240916043440-mutt-send-email-mst@kernel.org>
References: <20240916030835.68178-1-parav@nvidia.com>
 <IA0PR12MB87130A72951032F2936544B1DC602@IA0PR12MB8713.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <IA0PR12MB87130A72951032F2936544B1DC602@IA0PR12MB8713.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 16, 2024 at 03:11:10AM +0000, Parav Pandit wrote:
> Hi Michael, Cornelia,
> 
> > From: Parav Pandit <parav@nvidia.com>
> > Sent: Monday, September 16, 2024 8:39 AM
> > To: virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com
> > Cc: Shahaf Shuler <shahafs@nvidia.com>; Parav Pandit <parav@nvidia.com>
> > Subject: [PATCH v1 0/5] Assorted editorial fixes
> > 
> > This series covers assorted editorial fixes to fix name, adding missing struct
> > and fix spelling errors.
> > 
> > changelog:
> > v0->v1:
> > - added Reviewed-by of Matias Ezequiel Vara Larsen
> > - added github issue link
> >
> 
> Please open a voting ballot for these fixes.
> The github link is: https://lore.kernel.org/virtio-comment/20240916030835.68178-1-parav@nvidia.com/T/#t

yes but everyone is at plumbers/kvm forum.
Pls request it in a week's time, ok?

> 
>  
> > Parav Pandit (5):
> >   device-parts: editorial: Add missing struct keyword
> >   device-parts: editorial: Fix metadata type name
> >   crypto: editorial: Fix spelling errors
> >   gpu: editorial: Fix spelling errors
> >   common: editorial: Fix spelling errors
> > 
> >  admin-cmds-device-parts.tex         |  6 +++---
> >  admin.tex                           |  2 +-
> >  content.tex                         |  4 ++--
> >  device-types/crypto/description.tex | 10 +++++-----
> >  device-types/gpu/description.tex    |  4 ++--
> >  5 files changed, 13 insertions(+), 13 deletions(-)
> > 
> > --
> > 2.34.1

