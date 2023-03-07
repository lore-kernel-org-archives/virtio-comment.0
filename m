Return-Path: <virtio-comment-return-4746-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6162DC6FD1B
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Mar 2023 16:13:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 942A241EE7
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Mar 2023 16:13:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7EB099866CC
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Mar 2023 16:13:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6DB3A9866C5; Tue,  7 Mar 2023 16:13:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 51B329866C6
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Mar 2023 16:13:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: syyLN-yMMhW_bVDcHCXxWw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678205586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/ZiGnvwnABySinijQZzMTBCynCMdOabHec33IXZr+g=;
        b=Ec5GYqK3//7ODsLGkL/dMSfUQySThMrJCxsWihQ4wMW106BRXdOq9YM7fOSaqkkXhC
         noznMKPjdwg5rDXO9E+Lw8HFuCZT7Kc9UOqD0vRIK2TK57Z3lb9C2IeZCnfkwLW+lMDx
         W28+8/DMZ1r5pXqb0rYGaqm/2hi5RArEtfK3lNfi9GyKYIGjpGC1h5ZxboS2YB3+a5Rg
         u/lnvCOu1R60h6XV+dHzQ7RpyF1MdULR1nNFGiHXzZBHp5fU+D0CV7v8V4coZVD/RDxW
         ztmtk1AGNmktXhYB+1dTjX5WVB6C48G0GF7V4Re01DUHOrWcm5oMRPIi0rCDftIG8kel
         3dPA==
X-Gm-Message-State: AO0yUKV5RRDKmWfPaeywUA0aRZbrunAJKHuQTgnPL0BWFqS/Gr59lwIf
	upfnzHKBSkcXIqrJ3qZYaiZYXvj3gG3qFa8WcULCLZKbXLwKWYeo71u51X1+Jpk++gs69stxcHa
	YvEvnfonI40D4bnhh5NNd6edUfPeRGuX8xA==
X-Received: by 2002:a05:600c:3552:b0:3eb:3692:644d with SMTP id i18-20020a05600c355200b003eb3692644dmr13530835wmq.22.1678205586281;
        Tue, 07 Mar 2023 08:13:06 -0800 (PST)
X-Google-Smtp-Source: AK7set/RXaMK1doVkCadLKks1BW4lU+ILtQjeV3PlfLSIkSaJGIpkxtBdWFEb74m+oj0XA5eEU3gRg==
X-Received: by 2002:a05:600c:3552:b0:3eb:3692:644d with SMTP id i18-20020a05600c355200b003eb3692644dmr13530809wmq.22.1678205586012;
        Tue, 07 Mar 2023 08:13:06 -0800 (PST)
Date: Tue, 7 Mar 2023 11:13:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
	virtio-comment@lists.oasis-open.org,
	virtio-dev@lists.oasis-open.org, jasowang@redhat.com,
	cohuck@redhat.com, sgarzare@redhat.com, nrupal.jani@intel.com,
	Piotr.Uminski@intel.com, hang.yuan@intel.com,
	virtio@lists.oasis-open.org, Zhu Lingshan <lingshan.zhu@intel.com>,
	pasic@linux.ibm.com, Shahaf Shuler <shahafs@nvidia.com>,
	Parav Pandit <parav@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <20230307111143-mutt-send-email-mst@kernel.org>
References: <20230302190230-mutt-send-email-mst@kernel.org>
 <20230303132840.GC2866370@fedora>
 <20230303083213-mutt-send-email-mst@kernel.org>
 <20230303202133.GA2901137@fedora>
 <20230305043419-mutt-send-email-mst@kernel.org>
 <20230306000302.GA244754@fedora>
 <20230305191351-mutt-send-email-mst@kernel.org>
 <20230306110340.GA35392@fedora>
 <20230306133525-mutt-send-email-mst@kernel.org>
 <ZAbvxj+7lgaI1HkI@nanopsycho>
MIME-Version: 1.0
In-Reply-To: <ZAbvxj+7lgaI1HkI@nanopsycho>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [virtio] Re: [PATCH v10 04/10] admin:
 introduce virtio admin virtqueues

On Tue, Mar 07, 2023 at 09:03:18AM +0100, Jiri Pirko wrote:
> I sense there is no concete idea about what the "admin virtqueue" should
> serve for exactly.

Because the virtqueue is just a virtqueue - a way to pass around
commands.  Admin commands are used whenever one needs to talk to one
device about another one.
-- 
MST


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

