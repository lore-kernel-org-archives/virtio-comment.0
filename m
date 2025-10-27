Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440493195E5
	for <virtio-comment@lists.linux.dev>; Mon, 27 Oct 2025 17:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761587816; cv=none; b=VYMPGSE1wFu3vTHYGKPB0VuDm+TAUQFcKW/YK84vKWaZXt+Wxd3PTpaqtTWJOirKp0Lsyh+qBXaZAMT306Gzbfonr/Kp40oWJyoaOc9+61HhyMxUz/vDNgebTtR7XUB9TRN8h+/y7dBfW10RjRdHen8xgZ2IrF7ErrrfjVVGBUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761587816; c=relaxed/simple;
	bh=CRCNYjCrG5TUoSUamBpkH8/pwPOZasBjHKr95ZD+pXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=gjubyuVUR+16MA6J7LivGXrXoNwR+uwJEl5ZWpt63qDPbj02mkdGcooD/lM68RuAVWCDzwaEqHWQ0eAy5hD8SKmI9Au/2oOX5TvHUFu8rb/j7AvmBuRgsZxY35RqQH4G8kWoZUwLEcaGG/9gHCHTab73fOBm8EXwVVelvFrAkLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gsZeW/Ne; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gsZeW/Ne"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761587814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9ciubRBrmDTe8Ri0wDPH3X6hNwzQtZSqk7NtDSy1snY=;
	b=gsZeW/Ne0BnlFqIT66E+tCmRnwf6KIm0YGBTiOKR9BFYWQE9NMhaUpwaBa3DQEHEgP5OOO
	vRAG8Fkxp0iQeTTkAhA0MSCbIf20pp2eXFF133fROqo033ivY7YXsYQRubi5U5Tit13jf/
	3SEhUKSzyWVSaCsPtrRgX9cSpAnDKTo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-9mqazHPuNxiL6lUFf7Z2pw-1; Mon, 27 Oct 2025 13:56:52 -0400
X-MC-Unique: 9mqazHPuNxiL6lUFf7Z2pw-1
X-Mimecast-MFC-AGG-ID: 9mqazHPuNxiL6lUFf7Z2pw_1761587811
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-63c588cb6d5so2004605a12.1
        for <virtio-comment@lists.linux.dev>; Mon, 27 Oct 2025 10:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761587811; x=1762192611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ciubRBrmDTe8Ri0wDPH3X6hNwzQtZSqk7NtDSy1snY=;
        b=lSCKLI6HIwJPpSslURLN7kECsVEECeJwH3/WIhJeO/XlrV5Zc9eonpTYYAl/AkXndm
         HxVo6YbghXBV9t9ZjPgwqJyQZf4PCXk+VBAaGbbCTKhLnlosnzTdXxAuQWLHc1LaDXii
         crRbFbx8g7Y5rwAA1qEXWtwq0tDbV9cZybsbxI75C0Y+miL/pUPcyPZyyr7kc1tJyIOv
         noUusgVtgG0r2/4llAW0AHZAVqPisvpgAaaZA0REgjdQRqg97uAJVJq36RrK/7INNbE4
         N+abXjYanZTRT0NhU1UHDwTlaGRoFdDsYxZtlDnEEp8SVP7hEY6uGH8B+W0FjOXp/oDE
         KdcA==
X-Gm-Message-State: AOJu0Yy7UIrWSSeru+kgT6zSjrgYkxnUuVJBSpZPzvfnlDd84gQ7aWf3
	nVJqFv5FlBldXqUCXsWGWUVDry1mOLTx7Eh8O1Zmv1ODXlUWfnaJnfy2PezwwozF7VKPhqksYpZ
	sep9BWNbKvnBbsPdC6j/o21ktLooVkG+l8JRglCaE0SG67cpdghhhDVp0KbcQmpfzfJSY
X-Gm-Gg: ASbGncuKTQLAJxYpIaWRsWojRhR32CQNhRq55yCirpWTynzVbtn2NNU0EMwUsZuHbZe
	hU/7XQpjsjTcoMNOaAa276HfGEqDZOvykJa/NDtDFBEbWCn28HnI9Wra5euyxtF70sfqg8RiKcE
	ATO1e19Pooi7Vxe4zmVcPyTFhaGFQhs/rNlUwBhS+Lv7fOiChmSPiApGeqp1miHQ7bdyLeoIHl+
	Jw5PrXunPDBbzsrXhxiWzUAh/8VJKaKRgMceApMEkmNwlNGbIDjgChh0HWI80ETBlFEe0YcbCF3
	e5zdW3AuKvhKxHAIam1ni/xzu2EUUSZhGQbUFqRAyGwvukye2VxPmPrx5ictlAiM
X-Received: by 2002:a05:6402:5209:b0:63c:11cd:be57 with SMTP id 4fb4d7f45d1cf-63ed811fff6mr763178a12.5.1761587811197;
        Mon, 27 Oct 2025 10:56:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbMbhdsyC871kxqOo8hPZSrn9UTKJ+3z5/epQ0oXaPqUN7EtztMdcHGqWPVxiqmDAx42158w==
X-Received: by 2002:a05:6402:5209:b0:63c:11cd:be57 with SMTP id 4fb4d7f45d1cf-63ed811fff6mr763156a12.5.1761587810620;
        Mon, 27 Oct 2025 10:56:50 -0700 (PDT)
Received: from redhat.com ([31.187.78.209])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e86c6d7d3sm6567523a12.27.2025.10.27.10.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 10:56:50 -0700 (PDT)
Date: Mon, 27 Oct 2025 13:56:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.linux.dev, cohuck@redhat.com, mvaralar@redhat.com,
	shahafs@nvidia.com
Subject: Re: [PATCH 0/4] editorial: Prepare master branch for 1.4 spec release
Message-ID: <20251027135611-mutt-send-email-mst@kernel.org>
References: <20251027174756.56284-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20251027174756.56284-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kzGvBHAd8rvZ4nnECJ4_MJtntWY5k2zLft_TzjM8Inw_1761587811
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 27, 2025 at 07:47:52PM +0200, Parav Pandit wrote:
> Hi All,
> 
> This short series prepares the specification for release 1.4 version
> from the master branch.


I noticed you updated latexdiff module - intentional?

> note:
> makediffpdf.sh still have fails and needs resolution. WIP.
> 
> Parav Pandit (4):
>   edit: remove old changelog
>   edit: add changelog for 1.4
>   edit: Remove annotation of special character
>   REVISION: update to 1.4
> 
>  REVISION      |    2 +-
>  REVISION-DATE |    2 +-
>  cl-cs05.tex   | 2120 ++++++++++++++++++++++++++++++++++++++++
>  cl-os.tex     | 2605 ++++++++++++++++++++++++-------------------------
>  4 files changed, 3407 insertions(+), 1322 deletions(-)
>  create mode 100644 cl-cs05.tex
> 
> -- 
> 2.34.1

