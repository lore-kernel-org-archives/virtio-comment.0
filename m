Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B6514830F
	for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 08:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719303709; cv=none; b=t8MrizdTJywtUBNp9I5Xg9mQpqr8/SgaZF5LmlBVh1PbEgwHgiVNp9Q5Q9G1KCpx+I+jUtlT6CBp0+yGtNJFHjkLeZuKI56HQ40J4hTDYsQrthOP/CUAAMarpZHzCj1cT7lCfvyF+PFlR80tXftzIUVhyjourD+u0H0+bHujU30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719303709; c=relaxed/simple;
	bh=JR8qKhJvQ/txf8fEeCNuYWYPvllV31h3MTpScdVBOEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=kCoM22N+Xijd31ZuqCM2/pH4t/jZ3o7AHPclko4VqPk7LuCV1hvOsnz2nzm5ILmhjNVrwH6C/7SiY35HhhL+NRRfvZHMcTkX85iSf5kV55bsz/tuV6kFWs/a+DDt6C0H9bXBQR453K0bqvNGIIDLlXwZOBpnCOnL61tGUolenWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V0DUmA7d; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V0DUmA7d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719303706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PILfCsEMg1sVX1oYUC2/KzPnAN7TIGqmFs1F2vUsiFE=;
	b=V0DUmA7ddFSFlA1C2uNkW3ibF7YSq8NL0GcGoHyb1f9DCyv+S5OkRS2rZHQ6wFbViOgN2V
	fgB3j6dTRkFIcK3zLkbaLhaxZA6ShNb22Gjnxy3R3f8+/6xOBfjcvqv1YXn4W8O3kwtb2O
	zaFqY0SGBK1uvnVme1aVH10qXWLeLbQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-N159IRcuPSSYDiCPeYA7cw-1; Tue, 25 Jun 2024 04:21:42 -0400
X-MC-Unique: N159IRcuPSSYDiCPeYA7cw-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-364dfcace34so2301320f8f.0
        for <virtio-comment@lists.linux.dev>; Tue, 25 Jun 2024 01:21:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719303702; x=1719908502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PILfCsEMg1sVX1oYUC2/KzPnAN7TIGqmFs1F2vUsiFE=;
        b=Rt6Dqs1wit331bP3CNQ+v4od1wTIkrB79wNzwQy3So3oq6U4beitScw6HXDYIEKZzY
         RKQ24YCWeBRH5UQjyWPszmkgxLg5DXXXR1xLGwyzjLdd2HsZkND1pHnY/YyXdbc3wAJe
         US4gprWKm0dIvC0yQTb6Gm5sjOPYRFEhlzcFtHoaixXMQm+dZCkgF2pZTQ5lt72kyvPN
         Ih0frT3tOtgfYdvVWUn237xZZ4sLwKJ7+VfU7I6F9BezUIC2zD97AC4GJIQVOUXBQIXp
         n8C5Z1fle/wejFW3O0mXCX4WqgjLjWBN2ivjz36iRmQCBkUZCtxmj3jPUke01FqcUoI2
         N+5w==
X-Forwarded-Encrypted: i=1; AJvYcCV0/lJ7I1LUo++1rH0MeLyLq7T+5xDldLA89rysqMQuY0kQLlU9tSl57zA6ylDoHiKFC6yhhufvNze7ZP/qoXL7sdO416OEKHMxnp8W3JQ=
X-Gm-Message-State: AOJu0YxQSIZzVUwp+HSd0h9l/qFN/AtYa1A5JgSfMZYXSEDV5yZLEPIj
	jUuFUIHbpBvgISiQETs0HebLNQVnccY8skhIoMcV165Vey2aqR5MnAvgw6L/tM7xRdmlr/sN/OU
	PIaZK41zeSiJiMMKBocpysWrjBw/IIJMxOKH3yPiOrYZP4PNXeRYQb0TAGKyoK+OJ
X-Received: by 2002:a05:6000:178a:b0:360:7887:31ae with SMTP id ffacd0b85a97d-366e95d37d3mr6529203f8f.54.1719303701655;
        Tue, 25 Jun 2024 01:21:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFi3RKlLrwRKz4UiWzv6vnDgJ5A6UKI7yvYZAzp91WeiRA095EaEhdl4zdRjuDyu3FcWEWg+A==
X-Received: by 2002:a05:6000:178a:b0:360:7887:31ae with SMTP id ffacd0b85a97d-366e95d37d3mr6529178f8f.54.1719303700906;
        Tue, 25 Jun 2024 01:21:40 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:342:f1b5:a48c:a59a:c1d6:8d0a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36638d9bb1fsm12244961f8f.49.2024.06.25.01.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 01:21:40 -0700 (PDT)
Date: Tue, 25 Jun 2024 04:21:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Si-Wei Liu <si-wei.liu@oracle.com>, Heng Qi <hengqi@linux.alibaba.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH v5] virtio-net: clarify coalescing parameters settings
Message-ID: <20240625042103-mutt-send-email-mst@kernel.org>
References: <20240613021132-mutt-send-email-mst@kernel.org>
 <1718591277.4770932-5-hengqi@linux.alibaba.com>
 <77ec85ae-0f50-4093-b499-3b6defec4ade@oracle.com>
 <1718869209.8824844-6-hengqi@linux.alibaba.com>
 <e774e811-27ba-4151-b300-e22161f1b4d5@oracle.com>
 <1718940245.6932242-13-hengqi@linux.alibaba.com>
 <b9e47c91-46aa-4526-b441-de48906f1ae4@oracle.com>
 <CACGkMEvFmh-xq5TWqf16YMPSVkmz1BfKcuR7H9vw1zmouD-kZw@mail.gmail.com>
 <20240625040500-mutt-send-email-mst@kernel.org>
 <CACGkMEu2ziqC+Byv=XBYmeuxjUSQdyq45SFEuQmSYBTU18+v5w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CACGkMEu2ziqC+Byv=XBYmeuxjUSQdyq45SFEuQmSYBTU18+v5w@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 25, 2024 at 04:13:44PM +0800, Jason Wang wrote:
> > I also think we need to have a way to reset to that
> > default value. Maybe setting #packets to 0 should do that?
> 
> Or a dedicated command.

Kind of seems like an overkill, no?

-- 
MST

