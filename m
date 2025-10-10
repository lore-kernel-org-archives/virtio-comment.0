Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3321E220698
	for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 12:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760097664; cv=none; b=XFYp3Zlt7Rifjx++WmNYEoR/gE8jiWQ1Yo5VbeHyRN8bN+6UPSBIDTDMA4TPiRRDfuuIAbJKhF+Vqqas9unJvSrd+mnMEHR9EKOEUXZpmuT4oqrEZcLyPnLo7eLk23DcHoAYEGFrJe0OrC3D4uUJyRO7mwiHDY8jz4QaULj0yYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760097664; c=relaxed/simple;
	bh=/5/32JQ/kVCFrvZ7tiWBiC4Lag3BNs3hu+sepBYt7lU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=S252yIIjNFraoIgNwQACDXwYIhrvg5r2M8xS9iXpkKVmzGs+hziv9OLSxcZWVjWbt3g0z7qRp0Rzi9cXxtkrKw7AAzjOd79OsadSAg+aLew1R2qF9yJoR2e7RxCWUCDiP0oorVIhNsYE6iBUI3krOEWgXgETmYvJXIplwD2Lw/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V8XrnAok; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V8XrnAok"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760097659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f0bMSWdX1QesrnEBkG2+kwXsOx9S0aew85lYYlMvXp8=;
	b=V8XrnAokfe8lIkGgZAjnqCOqqQub+NtsQLqKLFLIQHTV6VR58UFtXDlDjDlX0/7GVuzTJB
	T1ZS6/AtGk9v6DcXfqUQV/CPk/2Iam3Yf6H7hbPFeKuF+ZcaL1s7GuGNo/0V3A5JZd022b
	CqUYUHbHKMerlNHMW3ZBWGBp5Mp8mE0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-7_nlzB9MONeCj_GCkFWpIQ-1; Fri, 10 Oct 2025 08:00:57 -0400
X-MC-Unique: 7_nlzB9MONeCj_GCkFWpIQ-1
X-Mimecast-MFC-AGG-ID: 7_nlzB9MONeCj_GCkFWpIQ_1760097657
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-639dc704d9bso1711191a12.2
        for <virtio-comment@lists.linux.dev>; Fri, 10 Oct 2025 05:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760097656; x=1760702456;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f0bMSWdX1QesrnEBkG2+kwXsOx9S0aew85lYYlMvXp8=;
        b=licsCL9JM22rhrU3YYbvoRbZ7b505jdRFxdzH0g0fA9bV/vak6gvAX1Gem2j4QW15+
         HyJxt8d4qW3knkb84wxEkgZciBGtDSE16EXm1dc2ogEp3dyeR4/S91qhG3nIIXIpGcbM
         CZZ+J5Uq9UVnXEBorKyEKTX7mhSANPf/hiYZHoyLSjSpXkinVqACgkh3v8HC3OuNuSZl
         6KUwXpf7UDAHL037fTpdB7H0WSrVXWO3s8DqHPuDgnE8XY/wm2TGCSL8GgVOxrpXFIdA
         ipMw5JOula/R31lK1O53f/Rzx3Gagx/wuhS9vIVawM9vE0JlzEgEHy13Q6MV+sgDc+82
         Xglw==
X-Gm-Message-State: AOJu0YzhVd096GjNuWSlqXNID9SwSwBMLOB8Z6d+uW95ZE50ndeKBd3N
	N0P4cMoWXXTkisy2VygC8XQeQK/pIfb46M8SFIUrs9KbzkO0BxCJFUWaiHGTHw3OsUu8wfv+IOf
	AXAxj/cW5JFdYqPkHYKNYmULECcJIx+8tOiC9csDG0HcTXtGTJeYqRJ7l7kLYVOSh7BFnb5slmd
	SslnE=
X-Gm-Gg: ASbGncshaBD9Fz8fy5WA6ahGxscTMX8ts0FHrI9/6o+jfIMmoe6sWHlzdh5yqk6Q2SO
	0m8PVzp92SeWBeQnJRvcCpxlDOZU9QCOEpRdJ7gtJ+SgUKbGmr29lnHHXUpzvf/koJMkeIgKXDt
	3Y9IQmHgjWocId84hDPxQgCG4LqBgbEIXu+V2zVFXk2Vq/X/Gg4CwHhO9To3cJuh9ursg7HIFEp
	GbuhFmoi3xik6BMhanCq8iIeRqEAH9ZfIcFcIQAHip4MmZULIbQqeoAEvHlNKAeqtklXdisnECD
	/JmB+Fm5Nb6zpzKVqKpUwUKiBpo2
X-Received: by 2002:aa7:d0d4:0:b0:61c:8efa:9c24 with SMTP id 4fb4d7f45d1cf-639d5c6fdf6mr7540877a12.37.1760097656350;
        Fri, 10 Oct 2025 05:00:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMuRRc4kBLEi/Ac5K4L8ZmaSdIQpH2/ycfyHKj/OPZsKYRO8OQInembvjInUVphHDdttHBow==
X-Received: by 2002:aa7:d0d4:0:b0:61c:8efa:9c24 with SMTP id 4fb4d7f45d1cf-639d5c6fdf6mr7540860a12.37.1760097655851;
        Fri, 10 Oct 2025 05:00:55 -0700 (PDT)
Received: from redhat.com ([31.187.78.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c321453sm2186401a12.39.2025.10.10.05.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 05:00:55 -0700 (PDT)
Date: Fri, 10 Oct 2025 08:00:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: virtio-comment@lists.linux.dev
Subject: Re: [PATCH v2 10/10] .github: add a runner to build the latest draft
Message-ID: <20251010075725-mutt-send-email-mst@kernel.org>
References: <20251010112010.3880438-1-alex.bennee@linaro.org>
 <20251010112010.3880438-11-alex.bennee@linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20251010112010.3880438-11-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PR64K4C7wwzni3N8rwrYqREtMASJrUyiczGLQt7l40I_1760097657
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Oct 10, 2025 at 12:20:10PM +0100, Alex Bennée wrote:
> This will run each time anything is pushed to the repository and store
> the result in the release assets area of github. To see an example of
> it in practice see the virtio-msg repo:
> 
>   https://github.com/Linaro/virtio-msg-spec/releases

Is this the PDF?

https://github.com/Linaro/virtio-msg-spec/releases/download/virtio-msg-rfc1-Linaro-draft-v14/virtio-msg-rfc1-Linaro-draft-v14.pdf


Some comments:
I suggest removing the version (e.g. replace with X.X)
Replacing "Working Draft" with just "Draft"
Maye stick the hash there too?


I also see front page corruption:
driver listing overlaps with related work.






> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-ID: <20251008145916.2626143-10-alex.bennee@linaro.org>
> ---
>  .github/workflows/deploy.yaml | 37 +++++++++++++++++++++++++++++++++++
>  .github/workflows/test.yml    | 15 ++++++++++++++
>  2 files changed, 52 insertions(+)
>  create mode 100644 .github/workflows/deploy.yaml
>  create mode 100644 .github/workflows/test.yml
> 
> diff --git a/.github/workflows/deploy.yaml b/.github/workflows/deploy.yaml
> new file mode 100644
> index 0000000..fec4910
> --- /dev/null
> +++ b/.github/workflows/deploy.yaml
> @@ -0,0 +1,37 @@
> +name: Deploy current state
> +
> +on: [push]
> +
> +jobs:
> +  build:
> +    runs-on: ubuntu-latest
> +    steps:
> +      - uses: actions/checkout@v4
> +      - uses: xu-cheng/texlive-action@v2
> +        with:
> +          scheme: full
> +          run: |
> +            apk add file font-liberation make zip
> +            make local-all
> +            echo ${{ github.sha }} > Release.txt
> +
> +      - name: Create Draft Release
> +        id: create_release
> +        uses: actions/create-release@v1
> +        env:
> +          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
> +        with:
> +          tag_name: ${{github.ref_name}}-${{ github.repository_owner }}-draft-v${{ github.run_number }}
> +          release_name: Draft ${{ github.run_number }}
> +          draft: false
> +          prerelease: false
> +
> +      - name: Upload Release Asset
> +        uses: actions/upload-release-asset@v1
> +        env:
> +          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
> +        with:
> +          upload_url: ${{ steps.create_release.outputs.upload_url }}
> +          asset_path: virtio-v1.4-wd01.pdf
> +          asset_name: ${{github.ref_name}}-${{ github.repository_owner }}-draft-v${{ github.run_number }}.pdf
> +          asset_content_type: application/pdf
> diff --git a/.github/workflows/test.yml b/.github/workflows/test.yml
> new file mode 100644
> index 0000000..34f4f44
> --- /dev/null
> +++ b/.github/workflows/test.yml
> @@ -0,0 +1,15 @@
> +name: CI
> +
> +on: [pull_request]
> +
> +jobs:
> +  build:
> +    runs-on: ubuntu-latest
> +    steps:
> +      - uses: actions/checkout@v4
> +      - uses: xu-cheng/texlive-action@v2
> +        with:
> +          scheme: full
> +          run: |
> +            apk add file make zip
> +            make local-html
> -- 
> 2.47.3
> 

