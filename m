Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFD42836B5
	for <virtio-comment@lists.linux.dev>; Wed,  9 Jul 2025 09:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752054249; cv=none; b=s5IOcB2p6x+xPgsHo+jX7VDPgDuNzXBsFJK8Kt3goXJSUC13aLIi0lsuiFppfhZoXMeixANisSf+CtHcfpBPoGnwn14q7RB1RIna3WYYzwE5ETYR2/qitOse5c5AFV5bVCalxa/rx9hZx3UXMLssZ/DRAe3lveTq5UqCD1uH+dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752054249; c=relaxed/simple;
	bh=Q2AurJw8A7BReyMP1Q/RxUtMkz7yCuUCcERT0/poEG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=BkI2bwYNLZ3lUR708I1xLTbE2Kom1f6yEmDd8OgRWOO4ZuiTRpa11lg+TcY+KRzM0AJnA/XwEI4SDRebEdRLCQhur35ibuHFJd0ZAfQHJzjD/xZHjW3XpQDJhVrVUre1OaMxfkgcfkig6Ms9Ag8GoR2MUkT1XzdX9Kf1ouceaUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LRPxOx0r; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LRPxOx0r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752054246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7P330oudtgFYHLAdqKXFGs8/1vkrY9CxMwvclaX4U8Y=;
	b=LRPxOx0r6tUKcNOYlHxGmEr4n+ky/LHNd3Z9J69WAn9tvPC3RMsPmXbBQjl2DMq3P0FKKy
	7ccs3HPkFurWRcnZNxHJMlvcVn9h5sYCmIxGwP1JHKMFKKsuxEBS7RuUyBgwd35JdbhLKk
	CaOYQQLhqoX7Gfcs+65c7pZkGoBOM7k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-yLiW-A7YNXCwwaHRFkQwGQ-1; Wed, 09 Jul 2025 05:44:05 -0400
X-MC-Unique: yLiW-A7YNXCwwaHRFkQwGQ-1
X-Mimecast-MFC-AGG-ID: yLiW-A7YNXCwwaHRFkQwGQ_1752054244
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-451d7de4ae3so31493445e9.2
        for <virtio-comment@lists.linux.dev>; Wed, 09 Jul 2025 02:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752054244; x=1752659044;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7P330oudtgFYHLAdqKXFGs8/1vkrY9CxMwvclaX4U8Y=;
        b=TtStFrnwGTlX9IETnm/hgFkPM+stwwIV5Eul/SXD7pduTbJVuFPYv8T51lZfCDJ66k
         nXMoKfRogaQ9vNfLH/WYKWLkrwhESr/drO657JYP9VYEw8FIhNXRZR1vnbJ/NxKufw4A
         z4jDgO7OoDzmhfRtcWGp8USAaYjTIn1b0zxVQ9HdV4af8i4ffeOTfObmH1IV7qzVD8lD
         gejlbwK9fPfXgl+UbU6OcZ2UhMh7Q4TyFjQKypcV+JvPqJ6UG9bVzibxPzrekrddhHGv
         iD2krImtM4R+zKK07YS4fX+j0rxFtxfAe+gt5j+29c9vwuhr1tR9qO2DjwObYIX4VV9P
         aOwA==
X-Gm-Message-State: AOJu0YwxW2NgdD/tuhSLY84nr6t0f1Jv8PcHA8qvlU5nHvcD9GJw2wzM
	o3KZRIXRo28NwXujTBBdQCRQYVwjFpEbpv5ez0TA5sE5BtOBWlOwUcupwnYk9F7mq//T1uJjWRK
	E4E25jlKCkBYD1S2yyjr9CYyDkc1bWDME5UTx7x2XOfcTxW9KWQt3F2hGHU+GO1SNN6FA
X-Gm-Gg: ASbGncsAHnoCxXpYqSztoa6f3Kj+4acFMRz9Vu9VtT2Ik2yk31wE4z+KTupDQBNiK6U
	3vn2EYwFmr7EgzmN7Pk+W1zO6xWRXFL+L7Wz5v4eiz2n6Hk3HuW1NrHVEpYtWxDojBDLuMxDZI2
	NnBIQg+uBGvnqCaDEzHo5fAIqfYarnpnM88spWr8piEiXZDihv4PhlcrYZllHMble2zfeq9XTZT
	QuC39359iQ68XNMI101pEnb3iIprcoIqn1oL21vd/na+SLtZLVTH29BsepYLYMs9JOonru3h1I7
	getB5t34yK2F3j0l
X-Received: by 2002:a05:600c:c87:b0:43c:fd27:a216 with SMTP id 5b1f17b1804b1-454d53cfe90mr14537165e9.23.1752054243988;
        Wed, 09 Jul 2025 02:44:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyBZPqSa836vSSBdzFBsnKVGbQoY9hrnfzWjeH0CW0faObbp8jWo14lvH0eDlVq7Es1eLpxw==
X-Received: by 2002:a05:600c:c87:b0:43c:fd27:a216 with SMTP id 5b1f17b1804b1-454d53cfe90mr14536805e9.23.1752054243494;
        Wed, 09 Jul 2025 02:44:03 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b975efsm15031143f8f.46.2025.07.09.02.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 02:44:03 -0700 (PDT)
Date: Wed, 9 Jul 2025 11:44:01 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: virtio-comment@lists.linux.dev, ribalda@google.com,
	alex.bennee@linaro.org, adelva@google.com, cohuck@redhat.com,
	hverkuil@xs4all.nl, gurchetansingh@google.com,
	daniel.almeida@collabora.com, changyeon@google.com,
	acourbot@google.com, mst@redhat.com, eballetb@redhat.com,
	agordeev@qti.qualcomm.com, gnurou@gmail.com, dverkamp@chromium.org,
	nicolas.dufresne@collabora.com
Subject: Re: [PATCH v9 0/1] virtio-media: Add device specification
Message-ID: <aG454cwrUWP3xjAU@fedora>
References: <20250709093456.350242-1-aesteve@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250709093456.350242-1-aesteve@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: d1-t0_S1QwmRIKy4u6w4pmmcOWl3tKH4hU8ttoWf9UM_1752054244
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 09, 2025 at 11:34:55AM +0200, Albert Esteve wrote:
> New attempt of including virtio-media
> device specification.
> 
> v8->v9:
> - Rebased to virtio-1.4

I wonder if it wouldn't be better to just send a patch that fixes the
series instead of the whole series again. Such a change would be a non
editorial change thus not requiring to vote again. The v8 has been
already voted and accepted.

Matias

