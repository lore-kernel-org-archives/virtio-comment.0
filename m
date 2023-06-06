Return-Path: <virtio-comment-return-6182-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFA4C7EE37
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:46:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F05224256A
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:46:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D51D998658A
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:46:55 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C040F98657E; Tue,  6 Jun 2023 22:46:55 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ADB64986583;
	Tue,  6 Jun 2023 22:46:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gH9wyK8laOglQR0oB+73DN7ZxBi17aGbKkvOB/utZHuC+OFVXnrQE25Tye8rzr6kmPi4EcZfGxndCkerREOBVYDyQNVpceBKMZg2yHQt83qFnuEd8u36EoQ4AGYuX1cgAlHLEz4PeNGq4HX5e5oIH1jqvLRWGerjfTLSRTp/PseU+perzPFf1HqDxvNjqPEiEgD8VEQq7EzaRS7KI5nXbGaGbzTB9UIMQBCEZjISTGh/QpV1GmiBIQnRxirDfo4IyEnUPdcJf1bor3tJBwISyom92SUy6Aq/cySMB0BCyFgqxrnMBvRRvOscI4IWc/vEtu7NOio6sqyRSA5yavmKSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pdsjCvqxURzk9BVyi5tGVKWic3YR3WUZbqPNwPIzo4o=;
 b=aNiD3bqgFVtnfkF80HKPAW/UIMD5Tr1FS0w1p90XQbyP7+TAATEQADdqZ/liMmCE4wN04/xxYuu4kJcba23zWBuqWXfbRFj9v5WLC5JJ1WjQ8dDRF8pj7lyIS2Ne/kxZd3BrRYuRqIXPGj9AufqFuTNfIY7EC17KDmvTIryg1rs1s/v3ljvfUHWJZ7m9e0W99+FzcgIqEZCAikjyExN5Hoy0TPeASNwCoS9We/VGRWlqR6nGdCsjHNacC/kiU4mNLjCcTHDn+DjwgQ0U7S/rWUZTB0NTmKOKEdDUJ+hExHI9SRRLgllplmh2s9IGAP7bsq11/WtNB78XyK4hJRWOqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
Thread-Topic: [virtio-comment] [PATCH requirements 4/7] net-features: Add
 notification coalescing requirements
Thread-Index: AQHZlNToK29IzcyA60OAbWYb9M0A+a9+ZREAgAACI7A=
Date: Tue, 6 Jun 2023 22:46:53 +0000
Message-ID:
 <PH0PR12MB5481C5A0E642F63B8624DBCBDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-5-parav@nvidia.com>
 <20230606183336-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230606183336-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA0PR12MB8301:EE_
x-ms-office365-filtering-correlation-id: 63e49c72-0077-4190-8487-08db66dfec7e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 w8kIXduJRxJBoKyu4hduIAUiyYlO/NvpWGIooyGOXDIg+7ph0dmfW+pmmD8cB7HXNJkS88elkeo+YC4a6SMqAemfiNDRDC2MSyTrM+4N2VsjrkSsvQ8folgrGhOqdHrNiirznVx+ebrzeM1QnJqhr0awIFvHvkok0amb4NBYekyA7pMGu6Rsx4tK75Vz6Oosw/7JGwBaD9jgt6JtblNtE44gwIpyfDL9c1HWbwy2FjjijOtWDWf+Qr2TZIl7r58gx48of4K8g/DSl4ISNcBJz3P4okA59lxs9iImOpuQf+pXSUl4x7OUkq+oRZqdzg/njpTvnHnMKrQPogcZ87UTkrEpicJMMK8JSImJ85hiA1Jr2C2NJFJlCxSRrvf3iK7zU97+acgPkooKHwR/pdp6QBD39bBeVBQMASr9DwSe6ktdErPLzaNu67s6YpLUjAC/hXBQzkT/1uxr1+c0oeBq04t6OFXdySyFykTQCCA5Wy0Bxkwh+SYZHx/rsjFhZUTD0wGSCJJ46ogg3x0PPRnF1myQMIls5rh6acniz4XlsnBYCIhvKOReS0ynV8d6KCMG4M/zWIah2gnfJyz40qAeOOvFycbwee76oztleo4zduCj3CSu0FxBp4boQeVZzlvP
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(396003)(136003)(39860400002)(451199021)(41300700001)(316002)(54906003)(122000001)(52536014)(5660300002)(2906002)(76116006)(66556008)(4326008)(66476007)(64756008)(6916009)(66446008)(8676002)(8936002)(66946007)(15650500001)(478600001)(71200400001)(38070700005)(7696005)(86362001)(186003)(38100700002)(55016003)(26005)(9686003)(33656002)(6506007)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JJVBpavJXyRhmWiwgbPVuF7rLQQEtuCiaYZouUXAcUEuQO0fDmr2xK+x9Tio?=
 =?us-ascii?Q?saZeae+UJaA/7e+4Gkeq4LO6YFfWvCCQhOi6KqNV+eYWAgAiMRxibVGsEnUg?=
 =?us-ascii?Q?uWBwziaxDz4DmZLMd1drxtC+4ui2tFuEjrN+lbRegYvARLpv6NgrmETzvG9w?=
 =?us-ascii?Q?K2NwBU35uy3gqRmAEUuH+KSCX3zJc1oA4R7oXHKxQ8j5/5mJZiGHVVayHa6a?=
 =?us-ascii?Q?X+PNvJ5MvF6cDlogJzPSNVbK/QnuLRjmOlLg9+WsSGZ/GS3ZUZouFcG3PJUU?=
 =?us-ascii?Q?te76BxrOIyF/FHVZrwd6itzpNjRxJRobu8JBUuwmwfukMmtGksoZh8FIWqT1?=
 =?us-ascii?Q?16YzzZV7T2lVjMAfX9C7kgOH62DO2fnHqVXC6NnaJuRJpoxqtKSrAmpWj65R?=
 =?us-ascii?Q?IO44pYwahjjGgKNI+ZgJ7oWv03ZovOwjZJMj9Ug/yM8/Im7H/UULLey78SrS?=
 =?us-ascii?Q?mauoip4UijP2Fn3CQVxqMTfM8/f5wKewNyKYBVKVtcyGdp9cR9zLdiMiwlM0?=
 =?us-ascii?Q?+2GAIeUaWcNAXn+WFDP0pWW0CY8chsH1etzNpBya3uyw2Mo0CeFm/E1ZGbEl?=
 =?us-ascii?Q?m4VO3+oPIjd7Fc08oI0vgAY85pwINa5lSVYVJu7ausxa8FojNwRXqVRPtMWh?=
 =?us-ascii?Q?R4Hz0bl2tckOKaBFVQNXxe5MHzQ7Y1HB2unqoyrnn2AxxqOSKsD5NTOLe/Ev?=
 =?us-ascii?Q?rlHp6NONhReA+moY1rZqVqR/sRWyciW/DuFzCc6ZSfPDTSASbkMHT+GfdbaO?=
 =?us-ascii?Q?dOHAajNZbgVBCpc8L+7vg6nTtgfOLirb1LsRbPvc9YpkPCQ6YYl+8gyJUkCn?=
 =?us-ascii?Q?cIdZx+b0MG4slcWvcdksHxDad9S7gpVAORlzttV9ivn9mPDjzghMP1x+TKM6?=
 =?us-ascii?Q?Ncgs9e4KWtSSb6gaZ+5k3uqbbOGjfx4nGeBxws8nucamK4BstghY6xK3bpCj?=
 =?us-ascii?Q?oMp3mWc3FDHi5F5iVsu2Pn5R12Z2RuxYrwfwHx7HCb+POC5U1J19aRcVI8zc?=
 =?us-ascii?Q?0zDb8NERtV699DI9Uga+srzMYa+aHmxlDf/bn79MsBSC7AQ/PUdbXRbtl26R?=
 =?us-ascii?Q?lU8sGvxTn237i0w0EWQCt/chpjwpxW8LpuytLE1SrF8Hba/uRKRpmP3CqjCY?=
 =?us-ascii?Q?kVasTYgMLuNgPZKT7r6YXMHYRsVuzC7jYnAEWUeFrBYrw3tDbDH8qWcgGpqj?=
 =?us-ascii?Q?25Yhy1MT19dUGnMalv5DlfVCB9Va9N9gLVyq3wDSq9eI2vFV+e0WwE4YcyZy?=
 =?us-ascii?Q?Eg6M3CPNBhWxxCQ2wzVF6WkeDICOJpL/Me49MyKZk5UP7BvxBPdeBxCemkX1?=
 =?us-ascii?Q?Cx2XN7ijFsJ9eMOdrfVMrYPR5v7zCuaDyXkBfEAQjVhzc5rq7rZdebZXleuY?=
 =?us-ascii?Q?c/ancKMTVMOQcy8Fagl7ieRt/9twqbp0gQKrlPGq6MN4DEFe70fmk0Kd/HyY?=
 =?us-ascii?Q?v2gFT0aCeakuMq2C1T+uUN0yzdgvOmC9nua/BfePHPKCeKlY7Oua449hDhKw?=
 =?us-ascii?Q?+ISdvWskUYEdwAZJtNAfMDbS/urkrc/r9QZ4oGNtSlDlT16wM40yytun2E4H?=
 =?us-ascii?Q?2U0c+T+Elp7L8c4JhuU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63e49c72-0077-4190-8487-08db66dfec7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 22:46:53.4286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zaV/n0fYCrQUK0r9JVc8+mkvHJkWQcswuT/gkAu0uVfGCy/lbnpmzGDpgzyINnH8BtfE7b8m3iJLUs8LaJhd0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8301
Subject: RE: [virtio-comment] [PATCH requirements 4/7] net-features: Add
 notification coalescing requirements



> From: Michael S. Tsirkin <mst@redhat.com>
> Sent: Tuesday, June 6, 2023 6:37 PM

> >  # 3. Requirements
> >  ## 3.1 Device counters
> > @@ -143,3 +144,10 @@ struct vnet_rx_completion {  7. The device should
> > be able to indicate when a full page buffer is consumed,
> >     which can be recycled by the driver when the packets from the compl=
eted
> >     page is fully consumed.
> > +
> > +## 3.3 Virtqueue notification coalescing re-enable support 1. Tx and
> > +Rx virtqueue notification coalescing should auto-disable on
> > +   notification reporting to the driver. The driver should be able to =
enable
> > +   coalescing after processing the packets per VQ. This ensures that w=
hen
> > +   networking stack decides to poll, no new notifications are generate=
d when
> > +   per VQ notification coalescing is used.
>=20
> I don't know what does auto-disable and enable coalescing mean.
> Does this refer to VIRTIO_NET_F_NOTF_COAL?

> what is the problem this is trying to solve?
>
Current driver when uses F_VQ_NOTF_COAL, and polling, it still receives the=
 event (interrupt) from the device, because the time is always running.
(event is not auto disabled on generation of the event).
So number of interrupts are not fully controlled yet by the driver.

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

