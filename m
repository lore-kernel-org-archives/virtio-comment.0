Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746F31B425C
	for <virtio-comment@lists.linux.dev>; Sun,  6 Jul 2025 07:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751787248; cv=none; b=jr2pq2n/1+ko1ymTnJ2byyHMzLSVZEvWOKwiJ6FBTGSb99nQRqs3JJGU4rZsnA3mXxNMJ1mCdGhBvuMa2nhjJlmR6bhwh1JaGwxuhnNuXSfWf3r9iEfRRAql9jPkQlAbsrvVfqEwIxfdwXzTnplPUSIp3RNZ+cvIN0xiyHqEn0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751787248; c=relaxed/simple;
	bh=ubuqmXwKRVIE33i5fSe7r2kh2rLK0tz4EwrBmEwvVWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=eCDRrYHUXDmHU6sH/bgGoRzeTOLy48XyDkm4rzzKCjKGLGJjYFales/InH/wHL7oGGBQ0Br4pmJ44bdWWJlxymNzO0+M1KIhgpxnXJfWp15hjeXPii155c4nXXJ7Pck8fSVNZRl5xEkex+7RnGfILe3s1uanihOgXEmIPDdz+io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZhNueGOB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZhNueGOB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751787244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IHT1uQRKZZw+9F3Xk7tS8JV+E6iUjNcKbnbd9VbSfKg=;
	b=ZhNueGOBE4oSlWUbuQkWlNAGX27h4affNiH4OM/abYj9gsHYat7EegtH55HPH/tmXPuJbK
	DSMSo8hmvH5S98Qhs2xmbdxmzU3I7UjnzghJvKg9c26VaxpYCGyGbvC6PQqX0slEyxzwCf
	1FXvRLw8K0RfBF2+a/zqNS4GBRaMx5E=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-Y8aaCicKOLK8fHR_51Oaxg-1; Sun, 06 Jul 2025 03:34:03 -0400
X-MC-Unique: Y8aaCicKOLK8fHR_51Oaxg-1
X-Mimecast-MFC-AGG-ID: Y8aaCicKOLK8fHR_51Oaxg_1751787242
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ade6db50b98so172412066b.0
        for <virtio-comment@lists.linux.dev>; Sun, 06 Jul 2025 00:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751787242; x=1752392042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHT1uQRKZZw+9F3Xk7tS8JV+E6iUjNcKbnbd9VbSfKg=;
        b=nPvw9spa3wWnZ3sG3tKzoAD40yUdNHqdpk+uQhe6Fr9gqrit8jMCrwj/JZGaurYQF/
         jcD5AyY4cBZ4S+nUtx64DB+9tvGlYa/SJTopmVwmfdnAlM7K+NETKRt43/cKz495WIbI
         9wuKuqR5ZWPt4OEhnwIV5TUZqi62EowaclrkbBCcuox+6zwXmGwekOHEFkQ7ErdTZBrV
         xDDMsvXh6P83jb4jVU9IZGmJp6tT9gEy8lgD7Rhu4UncZDNo28s33AxYTbmMk7uzRgwZ
         WHX8rYYyTrZLxhb/DYXjeLXmO1gLQ1eA7vg+1Rpr7hdvv0YPrv0hfEKFI7yPxzVpX1WF
         0TAw==
X-Gm-Message-State: AOJu0YxE1QlLPO3uoZRhRxxYzSuGNsYIgQWxQdWMUdZLq0dOTzItbI4D
	PTkCdnV+SksHUzeZhU3V7m/62xUBpQwfKshEIHfE/zYQRQUFLkUjNu+2o4xu8CwtFCyG5+wMcYc
	YOwOtdUxxGbtaVRAYBR1ewzZJ5ZWbx3zdE53VSrBODYlWnZ1wkZVq3sYm04evSUhX0o0Y
X-Gm-Gg: ASbGnctKq+OW5xYoZZ2mmtuE32OJUfBL7cZs9Q9oDBmtBoDOwXg0Tj3ewx/B5v+1pJ5
	umfSK99aAvR9dvASwCRUwqXdGRBDqpn/QcvWq/vnydjb1z/rksCN6jsI+9YydLCxVFi279GHu77
	VTah4fUiitbXN2d2LeGRLu+vLA4Vb+3G25/0M4wj5KefZrOoV2IdgT6t4VhRq2HIU9F8VFKZzX2
	HpLKXrbncsEHw4lo9n28dS5gTojZgHKBSLVtQsWU6eB9YJ8bGSlJEz/sPhHTWkoj+Y3As0Jcyia
	Gzodydd9n1c=
X-Received: by 2002:a17:907:d19:b0:ad8:9a86:cf52 with SMTP id a640c23a62f3a-ae3fbc8a09cmr820453666b.11.1751787241636;
        Sun, 06 Jul 2025 00:34:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQkEjmZUV1dY6tNk0/RxfpysC/pSD/kVMHcXZNaxJZM3ofdKl+PC5/watEFgZ+ag0cy2ZWiQ==
X-Received: by 2002:a17:907:d19:b0:ad8:9a86:cf52 with SMTP id a640c23a62f3a-ae3fbc8a09cmr820450766b.11.1751787241059;
        Sun, 06 Jul 2025 00:34:01 -0700 (PDT)
Received: from redhat.com ([31.187.78.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f692aa81sm477164866b.53.2025.07.06.00.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 00:34:00 -0700 (PDT)
Date: Sun, 6 Jul 2025 03:33:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"ij@kernel.org" <ij@kernel.org>,
	"ncardwell@google.com" <ncardwell@google.com>,
	"Koen De Schepper (Nokia)" <koen.de_schepper@nokia-bell-labs.com>,
	"g.white@cablelabs.com" <g.white@cablelabs.com>,
	"vidhi_goel@apple.com" <vidhi_goel@apple.com>,
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>
Subject: Re: [PATCH v9 RESEND 0/2] Update ECN and Add Accurate ECN feature
Message-ID: <20250706033336-mutt-send-email-mst@kernel.org>
References: <20250623081847.21264-1-chia-yu.chang@nokia-bell-labs.com>
 <PAXPR07MB7984F5C4CFBB42A74690F103A340A@PAXPR07MB7984.eurprd07.prod.outlook.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <PAXPR07MB7984F5C4CFBB42A74690F103A340A@PAXPR07MB7984.eurprd07.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LFcU5XsGP2O4QdfVK2qeiHic2M4vwH8a7xbOhFMJIZE_1751787242
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 02, 2025 at 04:40:09AM +0000, Chia-Yu Chang (Nokia) wrote:
> Hello,
> 
> 	Just want to reach out and check is there any comment on our submitted ECN and AccECN patches?
> 	Thanks.
> 
> Best regards,
> Chia-Yu


The patches look good to me. You can request a vote if you feel they are
ready.

> -----Original Message-----
> From: chia-yu.chang@nokia-bell-labs.com <chia-yu.chang@nokia-bell-labs.com> 
> Sent: Monday, June 23, 2025 10:19 AM
> To: virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com; mvaralar@redhat.com; jasowang@redhat.com; xuanzhuo@linux.alibaba.com; eperezma@redhat.com; ij@kernel.org; ncardwell@google.com; Koen De Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>; g.white@cablelabs.com; vidhi_goel@apple.com; ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> Cc: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> Subject: [PATCH v9 RESEND 0/2] Update ECN and Add Accurate ECN feature
> 
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> 
> Hello,
> 
> Please find ECN and AccECN patch v9, which aligns ECN functionality with
> RFC3168 ECN, and adds Accurate ECN feature. The Accurate ECN draft can be found in https://datatracker.ietf.org/doc/html/draft-ietf-tcpm-accurate-ecn-28
> 
> Best Regards,
> Chia-Yu
> 
> ---
> v9 (19-May-2025)
> - Update descriptions for VIRTIO_NET_F_GUEST_ECN, VIRTIO_NET_F_HOST_ECN, VIRTIO_NET_F_GUEST_ACCECN, VIRTIO_NET_F_HOST_ACCECN (Michael S. Tsirkin <mst@redhat.com>)
> - Add reference sections of RFC3168 ECN and AccECN (Michael S. Tsirkin <mst@redhat.com>)
> 
> v8 (17-Apr-2025)
> - Further typo fixing
> 
> v7 (15-Apr-2025)
> - Fix typos in AccECN patch (Michael S. Tsirkin <mst@redhat.com>)
> 
> v6 (14-Apr-2025)
> - Shrink descriptions and make more reference to RFC3168 ECN and AccECN
> 
> v5 (06-Mar-2025)
> - Update feature bits of VIRTIO_NET_F_HOST_ACCECN(69) and VIRTIO_NET_F_GUEST_ACCECN(70)
> 
> v4 (05-Mar-2025)
> - Update commit message of AccECN patch
> - Add reference to RFC3168 ECN and Accurate ECN
> - Simplify feature bit descriptinos to avoid duplication of text
> 
> v3 (21-Feb-2025)
> - Separate the original patch into 2 different patches
> - Fix several reabase issues in v2
> 
> v2 (17-Feb-2025)
> - Rebase the patch on top of v1.4 virtio-spec
> 
> ---
> Chia-Yu Chang (2):
>   virtio-net: Fix ECN feature descriptions
>   virtio-net: Define Accurate ECN feature in virtio-spec
> 
>  device-types/net/description.tex | 83 +++++++++++++++++++++++---------
>  introduction.tex                 |  6 +++
>  2 files changed, 65 insertions(+), 24 deletions(-)
> 
> --
> 2.34.1

