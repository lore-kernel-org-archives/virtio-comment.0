Return-Path: <virtio-comment-return-4851-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9035FC61DA4
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Mar 2023 17:14:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E11552AC52
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Mar 2023 17:14:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C4A84986702
	for <virtio-comment@archiver.kernel.org>; Thu,  9 Mar 2023 17:14:10 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AD5BF9866FB; Thu,  9 Mar 2023 17:14:10 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 97E779866FC
	for <virtio-comment@lists.oasis-open.org>; Thu,  9 Mar 2023 17:14:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: abFu2As5NiGaIGrrNfy4gQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678382047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjIVqJxjUfogqlFrRnS3zKQOJsTAc7Uy/n9PnZtsfFM=;
        b=IcY4DH2F78l+vzhJdA7K/GefAuLyOi1238uPfK0KfzjrOwGMLymD1zF2GMibx2tEjk
         zSbhhr8+Xam1JLAfnJrDHKFCpBTc4P1l+qKQatOAuHeWmBnAmPs+pG8kToQoJd03jzh3
         XJCPYbvmHs6ReosR97m/kM576ZsFvPlqhamvWwsF7JP5w2ZK5GcBH+5BIArrdBV+Mq9W
         NiO4TxcTZU0opRyNGhdk0ZbsCkxiBPa6vwW6HRkWONSOSykH9vG8iLSB2cKGfwbKhz4z
         B/5LQow5az06yOT8Z6DO1YQx08NePIHxm5IQ+f83ZqNSjsXuaBhHsw16ZL6xj00zs/65
         4zfA==
X-Gm-Message-State: AO0yUKX3XJqw84zEDnyg8THMSAiLMD/0NIVMdcnyFftkXK4ZRSg4Ahv/
	8a/jfxx/7QDfXt7VDd0InqypZudraMrRwESIsirzSjaKpdQQ+Ry7/6Vs62eZDwdxXeaYMOpnrHA
	um2Uwjv4Tnrb3TDc8xXz0WPjOYexXQbyQNw==
X-Received: by 2002:a5d:53c4:0:b0:2c7:11ae:9fd8 with SMTP id a4-20020a5d53c4000000b002c711ae9fd8mr14786225wrw.8.1678382047109;
        Thu, 09 Mar 2023 09:14:07 -0800 (PST)
X-Google-Smtp-Source: AK7set/2/PKsUsBwB7bagiyJ+MBQJtCBTx2vVhGigecASrxfwdlXky5JLFtOpss4pNn+za/6kvDADg==
X-Received: by 2002:a5d:53c4:0:b0:2c7:11ae:9fd8 with SMTP id a4-20020a5d53c4000000b002c711ae9fd8mr14786198wrw.8.1678382046822;
        Thu, 09 Mar 2023 09:14:06 -0800 (PST)
Date: Thu, 9 Mar 2023 12:14:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: David Edmondson <david.edmondson@oracle.com>,
	Jiri Pirko <jiri@nvidia.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"nrupal.jani@intel.com" <nrupal.jani@intel.com>,
	"Piotr.Uminski@intel.com" <Piotr.Uminski@intel.com>,
	"hang.yuan@intel.com" <hang.yuan@intel.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>,
	Zhu Lingshan <lingshan.zhu@intel.com>,
	"pasic@linux.ibm.com" <pasic@linux.ibm.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230309121313-mutt-send-email-mst@kernel.org>
References: <m2wn3rxgv5.fsf@oracle.com>
 <PH0PR12MB548150700B50006F9F174104DCB49@PH0PR12MB5481.namprd12.prod.outlook.com>
 <ZAmLIc97Ud09YfGT@nanopsycho>
 <PH0PR12MB54817E2CEFF003E793C9B2F3DCB59@PH0PR12MB5481.namprd12.prod.outlook.com>
 <m2mt4mxbt5.fsf@oracle.com>
 <PH0PR12MB5481FD2D2365CC08A5CD1E64DCB59@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230309091904-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548138694D606CE68B9E0C3ADCB59@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230309094240-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548118B78312924C00EF14D8DCB59@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548118B78312924C00EF14D8DCB59@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [virtio] [PATCH v10 04/10] admin: introduce
 virtio admin virtqueues

On Thu, Mar 09, 2023 at 04:53:59PM +0000, Parav Pandit wrote:
> Keeping my inputs aside for moment, what do you propose for v11?

Following SCSI and relying on driver to worry about ordering.

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

