Return-Path: <virtio-comment-return-6556-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2F3EB64D9
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Jun 2023 00:22:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 95E5F419A3
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Jun 2023 00:22:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 88B2798656F
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Jun 2023 00:22:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 72666986317; Wed, 28 Jun 2023 00:22:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 56E4F98654C;
	Wed, 28 Jun 2023 00:22:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDtu01FIiACpys4gFJyPuRftw29h/qCQnljryAElzf+ScTZJ5OOG2YjSYs4JN2sqogbQ9fliMIehb1MtybvWThGwWPMSlOWelmdC9tm+JVkNC0NmSSQGQ3sIrF/vrMZUFr+zHB+6amb3ImVul8NNwUGVDcM/jPaisyPD+bSUrHPrVuUcEVwl1HDA3Y8yjp+lLmoxh9igJdgfwrCwwkujrMw6ocWsQueoKlYzIkwq+FToX3JxjGgXoHPg82rci/DWga5U0CEquypgAPYip3KB3x6+IPPvO0vvtQoabbEYFHi0Ri4itVlqQxo9OFYnHo5wCw3k/V9y8sB3ErutX1NBvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SEDf4COL0F2md2e4HLkPga0xvhYMJ2jH00Lj2nkChUw=;
 b=gbo7q+KGqZovUW7jFoaSKPZH9Fw2PCM0As8tlhKqEcKn57/GpT8h9j1TZzZjiorMoxKS3WyKXV4DsUFKjWdGS0tWznBIG4lugnuJaGPF4hfnleojxIIhaJ3NRMmfxB3dXZ+YEIEvPjg18RfYZcr9hP41ZBuDR1mCf0Fz2Sz3zCsZELOyS4nlWclzW4TaBZsX9txnssCQx/xqTcOa9QCh1J1Re06OLv2mgmQzGyVJKDm888A2v17W9yjCIVMVpPx3Nrtpn6vwCkLlfft+TXOXRlP9UVizhnupjl+RIOT5q2jL+Qw9gVq1A01/x0pyG/dece7w3KAkZOqddoN7WMVxzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Xuan Zhuo
	<xuanzhuo@linux.alibaba.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
Thread-Topic: virtio member device provisioning get/set and virtio child
 device life cycle mixing not needed
Thread-Index: AdmpVpzpKKBUbqM4Qgq425cUop3WcQ==
Date: Wed, 28 Jun 2023 00:22:54 +0000
Message-ID:
 <PH0PR12MB5481821452DA2A9572714BB9DC24A@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|PH0PR12MB8128:EE_
x-ms-office365-filtering-correlation-id: 8684e5e8-4fdf-435e-eaac-08db776dd0c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Yn+nPDgjfnd2v7kt6Gb+34bqR3jjUWRLXcuKW27/7gOrWSBqm/TCkML64Z1isuISvVGlmIj4Wx4wTr3h3OTwNan4aJda68+p3XtDiCu+jo9nJlaeSAQe1NnYzWr3hk5S/fU253fR0QAxhCS5A+SmOyONTDP5I4fhJX5AwQP/wqWHwFWNSq0RD8B3BZsVBMHW+LwEPOulEI0FKAc3yet6hKXeGNgQWYDlBqWDKr2nWbfGBwpjcizpTFNjpswBkiuGl2yKQuT2TeKJaywNlOvVDvdRBRQ9KFVk72qPMA3FGttOBSavW02O34DsJGBWvMNcQ9NnwkenJewYH6Cnv/+zwRZdwn9WQmpLF5JBwTb6lXZL4IDbfNHrYnbqXBIaVnpTDZ3x8yT+iy3LVz8QT9XQSqYNgtU1pQ/rwZOMn+/f3Qknd6XygIC3BUnHXjg9mD4Yyw+Lx8k7RdmJoRXkSuxSpAjhwo14mepviRLWswD9Vc2Kc6zim/49m5QYbRFPoIR42owy9siOARzYWbpU+oNAsPi2//yiAbnmeq3MOcSshTh3lFOnZKS1kuLx/RclnQhChHzc3kV4jGiz4GdFOppFl3uZELDo1Z0W0dW5BWgA/rLBCMjfyIPz7J28bwcg+h7c
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(451199021)(8676002)(8936002)(76116006)(66946007)(66556008)(66446008)(55016003)(66476007)(316002)(64756008)(4744005)(9686003)(4326008)(6506007)(186003)(6916009)(26005)(7696005)(54906003)(71200400001)(41300700001)(2906002)(52536014)(5660300002)(478600001)(38070700005)(38100700002)(122000001)(33656002)(86362001)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MFHvH+T+bhhh11ZyfhcPoLq3N8Acd/dImtAJoMlo7HPjpjYq4uRi8UZXd4Xm?=
 =?us-ascii?Q?H4Stly+RvcEBRO0TGZxmfMKM+nXvn4XwA2+vopi/Ogxnsg5iIJP61voFxyEo?=
 =?us-ascii?Q?m+5/THpbjg0+XH6s9OqhRdpAptrjTInBRn6t9L722M23GuZtMfa8IDcRiUqF?=
 =?us-ascii?Q?qvPb/Gd1BqlHimwqxKEdKvO18R49ytNS8p4oooJW16rNWXqYrF4TUbZOBnSR?=
 =?us-ascii?Q?wXBBKOoNTYoirgXM1NDTI9PrEi5QTpVcs/vPPEfGjjD0nVvVlFuIoHix3YyP?=
 =?us-ascii?Q?lI6zs+NRQFI0Xb0DO9lYSdX8lpahurM9nqH1S2vnfo5xkr6QJeJtlidiPHpc?=
 =?us-ascii?Q?+NEo0S/nhPYUO9cIZ5zzOe+944U+W4cs9JFtPg6ahgHh4a7+beHfA79tokhL?=
 =?us-ascii?Q?d1LwU1/wWUsSHi81RONQtVIvYVulAuX5lKJRUrz7UWIX27F10edCKi/aFcbp?=
 =?us-ascii?Q?TvblxXVKiKlyccd1KYj4Mwog9ewt23jbA3ANz4C0FdEWvYImqV9fAp5FPQak?=
 =?us-ascii?Q?wnKDHyN86BYn6lIubD7ZQszCnDErARNUsE+mTHt0o3uDKM8KDDxIXxFLAjZ0?=
 =?us-ascii?Q?kY2geyXFUo4GpHEk9Mgs7uBny8l9W5CHAO/Y/cPuiMcoZYkL7j74KXmkm2+9?=
 =?us-ascii?Q?O2XPbB/q4Nmn0quWQsvmL/1MLgInVLcMuWNR1n9Fp7oNAZJ63ahNX4imeSL3?=
 =?us-ascii?Q?GQffpjypt5dxyg8lcEOqoYYjBn7nVfbUB9E4fzM42P8r5sh+DzepKYN0J5bG?=
 =?us-ascii?Q?V+FekwFlNuohUu4c4J1rMeFBbc/dHZ/y2Fe6cYDA0itca7f9M4XHSPhQXI7M?=
 =?us-ascii?Q?/unKCSE3yJHNor0hPe4E56/0c8wChYQGAVf2BbHccHiS55LSswsuqBH/BvSd?=
 =?us-ascii?Q?D20XsdZTSO2j9XkZ7dzi+IxdLzz7KXUekPLEBmBcHLJ/UDJomCGuxKTJJ9cV?=
 =?us-ascii?Q?tvaqf67V5ATV/rPm0E+UtEgW9b1t1seCaCUbgbFWXh0x+HmFmSsLZkFxja98?=
 =?us-ascii?Q?yd1UWOnhTKs7gRqJVKvR+y6VJ+Ksp3OoTmyxqXKr8xiJru6r8HueUN9VSc9z?=
 =?us-ascii?Q?FG3Si5/yo8x5xQT/UNVWh5WkSGiULFMSTQW9h2KNsEu8iD9IV7fYPzkRnUwT?=
 =?us-ascii?Q?5H+otGY/cU833JXtGk94I6mRRrPU8fNENdU64f/MQOgR2jiWCbNBwhktrj1S?=
 =?us-ascii?Q?xD5xhcgzQaeH54plErFDraRAP6D6iocXh5FHAkwp3yelJqts6YElpJRGxzLu?=
 =?us-ascii?Q?R7+QR2Tpvp5rDmeCOw3spP2Cb4PaILfbmALKiyM9n45DvWqOhkMB69+ijHQj?=
 =?us-ascii?Q?4t3arwBK68+hbxsaOhybEzMgTTPYZ2A4QXMV6uLwUEtfyL/mSHXZwzJRbNXQ?=
 =?us-ascii?Q?ICQfgIrGjUPmGMan6U+ctO+s0FjBdDkFH6ja2uwJtB3dCCt2H53Z1C/koW8Y?=
 =?us-ascii?Q?9Qmxz1OQI3pbjFUAZc+wvYTGWep2+MOCOLlA5vPslXdLwyUEl5Ddbd1TUYSL?=
 =?us-ascii?Q?KMQ5PPzTTDDMEznfj7gYB/aLHPKz4+QHvba0CDBUsh4k3lvstPxdnLqQ/xtW?=
 =?us-ascii?Q?fjJ6zpJ6f2GtbRwrTnM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8684e5e8-4fdf-435e-eaac-08db776dd0c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2023 00:22:54.0606
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yHDSd753C+CIQfXQXZSwz/nTHc1LkKbOVwBcrsxYtik8Q8+ZTtmCN+udKy/FApTM6V1HXC0/0ByRu5mDCOX1Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8128
Subject: [virtio-comment] virtio member device provisioning get/set and virtio child device
 life cycle mixing not needed

Hi Lingshan Zhu,

I have reviewed v4 version transport VQ a while back that consist of two ma=
in pieces.

1. some virtio device creation/destroy commands
2. virtio device feature and config space provisioning commands.

Many of us are seeing the value of device provisioning commands with/withou=
t live migration.

New virtio devices do not need to follow any existing of config space etc p=
er say for real hw.
There is some value in reusing software but it may not be the prime driving=
 factor for brand new devices.
This needs more discussion and not as_is done in the v4.

So, if you are planning to revise your transport vq patches as admin comman=
ds, please split the series into two.

a. device and config space provisioning SET/GET part.
b. virtio child device creation aka SIOV/SF etc.

First #a, followed by #b.
Piece #a will be usable for SRIOV VFs + SF/SIOV devices and provides unifie=
d APIs across two different device group types.

Parav

This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

