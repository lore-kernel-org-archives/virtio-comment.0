Return-Path: <virtio-comment-return-5229-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C50C6FD1D
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 16:44:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1AE6E2ACFE
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 16:44:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 05F1598658E
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 16:44:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E98C8986524; Tue,  4 Apr 2023 16:44:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D6C70986583;
	Tue,  4 Apr 2023 16:44:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
Date: Tue, 4 Apr 2023 18:44:25 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
        "virtio-dev@lists.oasis-open.org"
 <virtio-dev@lists.oasis-open.org>,
        "cohuck@redhat.com" <cohuck@redhat.com>,
        "sgarzare@redhat.com" <sgarzare@redhat.com>,
        "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>,
        Shahaf Shuler <shahafs@nvidia.com>, Halil Pasic <pasic@linux.ibm.com>
Message-ID: <20230404184425.300b9505.pasic@linux.ibm.com>
In-Reply-To: <20230404022928-mutt-send-email-mst@kernel.org>
References: <20230329212341.465843-1-parav@nvidia.com>
	<20230330191114.77acd860.pasic@linux.ibm.com>
	<PH0PR12MB548165C4B11375F8C7EE7AD1DC8E9@PH0PR12MB5481.namprd12.prod.outlook.com>
	<20230404033622.4b749f89.pasic@linux.ibm.com>
	<d62d2090-de0d-0ea6-5c85-ecf19ae828c7@nvidia.com>
	<20230404022928-mutt-send-email-mst@kernel.org>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: A-oz6z5D-2zcilang6kwIUT9Q1RM_DpW
X-Proofpoint-ORIG-GUID: FJGUAOrFbUgOqv5EFG3Rk4S9L0qRQNTi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_07,2023-04-04_04,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304040149
Subject: Re: [virtio-comment] Re: [virtio-dev] [PATCH v10 0/8] Rename queue
 index to queue number

On Tue, 4 Apr 2023 02:33:15 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Mon, Apr 03, 2023 at 10:57:35PM -0400, Parav Pandit wrote:
> > > Both solutions are equally consistent in themselves, but I
> > > argue the latter is better because:
> > > * it is more consistent with historic usage  
> > Well index/vqn has mixed up anyway now.
> > For historic reason, I agree that index is right.
> > But it is too late now.
> > Comments have not come on time.  
> 
> Why, is there a deadline? Is this blocking some other feature? For
> something that is supposedly a cleanup we might as well get this right.
> If you guys both agree index is better, and at this point it sounds
> convincing, why not do it? It's more or less a machanical replacement.
> It's not like there's a lot of word smithing going on here except for
> 8/8 which really works with index just as well.

I agree.

Regards,
Halil

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

