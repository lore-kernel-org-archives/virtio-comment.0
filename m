Return-Path: <virtio-comment-return-7117-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80538C0015E
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 05:51:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BA76319090A
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 05:51:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9E3F598636E
	for <virtio-comment@archiver.kernel.org>; Tue, 15 Aug 2023 05:51:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 89865984035; Tue, 15 Aug 2023 05:51:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 77BE998633F;
	Tue, 15 Aug 2023 05:51:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eX/lQXj7R45aWbp9aIO/yQX2+TdjQG+k5KzCav3U3wfK2avy6TvB4pAbsiSNDBzB0t7wpYQqBJ4krhExAyYjIThpxG7lCAeNwR5I6hHbGGwMhQvQoEYa78OaDUs3+sXbp95JQuCx6Of9xLVirnffM3xLAMZVMwkzd2Ns4Lf936EEAezugIczFp7I7hdemXss/Cits/KD7Jim5QjtPiS6L/br3RF+vSz+AjRv2zPyBC6veYjzUfrfp4U5zWJ1tMP4JSI6v0Hu/KTEXFLPgJ5/s8g0fdYwsp599xXfCfGUqa5s2dquce3Dn/5cPsPK6IpB0z/xaiwpd2jq8vGwxYzPkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8iCmzzNr/QV3gR2fAcNMZUB8zfQanLFFWoDbKhtDFk=;
 b=mLvRV/tWTfq3aCUhioTZl/PLwR8gF5hOhIEI/RxXaDE+DEodrUEZHjQYSY8j+BO1lFlRI6ExtNHh2Ck6lUoImlE1YsOdlP/uO+cL4ZwlIeGnWl9xgNjw+eqSvVZItVKDnPhaYckek/Pqsvz650c/xjJ7bYpb+Imn6Amezr8mjZHOHFyWpqLJRkY8kroHC0uzKmnQQg0lAOmDgWRjTg2FX4DjsrJPx7KEZJoCsWKoufFTpwedFWw9lGMOHE5IxhlmqEhtzbn8eEDdnVQmvtrzwztyGTWr/5t9uLG04LN+GcdK/jPDD6durLUvMWpvg5m6lQom6D+mwhurFLGwK5kTTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Satananda Burla <sburla@marvell.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
CC: Shahaf Shuler <shahafs@nvidia.com>, "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>, "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
Thread-Topic: [EXT] [virtio] [PATCH requirements 2/7] net-features: Add low
 latency transmit queue requirements
Thread-Index: AQHZvd/Nd55MWQDvy0+gjseUVrm3sa/j/2WAgAb9ZrA=
Date: Tue, 15 Aug 2023 05:51:39 +0000
Message-ID:
 <PH0PR12MB54811F7ABFFA9F8F7EB7F4B7DC14A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-3-parav@nvidia.com>
 <SJ0PR18MB44774F4AAFCABB7F4D21B20DC313A@SJ0PR18MB4477.namprd18.prod.outlook.com>
In-Reply-To:
 <SJ0PR18MB44774F4AAFCABB7F4D21B20DC313A@SJ0PR18MB4477.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|DS0PR12MB9058:EE_
x-ms-office365-filtering-correlation-id: 2536bafa-92bd-40f2-179f-08db9d53b1b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SHEiibLpBvfr3cl7OK5y/IPeVP833Vs5t87z2h6vgNQzV3MYNPd1+0vvvuSGDSgYCy7rxdLFQ3WHULTqNTlw2LyKsc5+6VcI40dwV+dqneNQczhraJSpSYpVJ3yVX7jKs9ScQHGyhSaVSNDXxEHFe058h+RWLAkfk6PpkKeQOy/+7rzwEuqbMoxAQFZfNI1oaMcgDLuwK5X4GGqwWFe2F1+eXlIuW9iP+9kbImhyNkg5yg1pAcwgaCkZJTiKydzMFO8CuwperujeUaItbsilAEbjWGfqv8neYjnd9DJ1vjRFCVZ2K+qPNaq1pYkpuyNt+bRlgY+otzBLrQ+0EZTwu2HLEKtaJ8g3kDrQSR2UFrZeej2qR3Nzj2130vnIzZrdzu8lMxb9zZ1MeK/YlQ/btsBZNe4kcuwsH+qQHww4t249ttbrMCybddr8gy29gmKPmDIILosExP2RqnUbysogpUpSLtAsAnqEdyrsEjPOjAxGwJqdqppj5msXe+qKWnQwQ8T75gaefPMox/iObpy2KwbxD958ZebQk4BWlkGMdN4CpXvoJJUzfPGJcjHqX2n0wqsTpHP45lqLpCDdXYkYZEWXhja97XM7jurzwQmweUCI/QfaiMJ33WbsGXjV1jJB
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199021)(1800799006)(186006)(7696005)(71200400001)(9686003)(54906003)(110136005)(478600001)(55016003)(6506007)(2906002)(4744005)(4326008)(316002)(76116006)(64756008)(66446008)(66476007)(66946007)(66556008)(5660300002)(52536014)(41300700001)(8676002)(8936002)(38070700005)(38100700002)(33656002)(86362001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?gHQCieARtAxunNUT5PlXFb9dngDIIbjzYYqBXaRpLQzXOfFZef2uqSh87Ey3?=
 =?us-ascii?Q?a/QI1pvvk2dAC86RYJJpPgO7xFbCmCpChvDIacdO056sHFG6y1AH/ARUlLNp?=
 =?us-ascii?Q?Bve6bMV6Q0deXACquich/x8BCIn78kPubk2QgV7to7NCYOb/vpzjVX5VLKSA?=
 =?us-ascii?Q?S+oOqWMuD9uomrFoeK9IqFGp/1f/RTBmX9cDu0Ig2bFJhvtd7ibpTt9nw8uc?=
 =?us-ascii?Q?RP0wiSBmVmvmj220w5Dk0izRHxC8xvTnVrkVh01+idytLHsk/wx0/cUMsa6p?=
 =?us-ascii?Q?/YdUWjwtR8fBtUGkiP3t0l555aPQWmB+/S7EYnTwlIsy+XBGrn0TGLSTx1BM?=
 =?us-ascii?Q?d4w+ukXdTl8HkqMbUWMsVTYX9Q0PpvGTGjJcZ4mc0oFI+qL8k/f/EQn4yCGP?=
 =?us-ascii?Q?6HkenKHm7ZBnXasmrFTIr3VG0Y8EOuFvQCfd4KEDIKh9JQPK+oO/q43oyxjC?=
 =?us-ascii?Q?cNopaXCluwyF2ZlzxSBmiRnrx4DC/FoK8KEOnlCfO7ZA4jaqHqpYiU+tjJ94?=
 =?us-ascii?Q?OcRwkL7HUq5BtTeX+xpHrbLj4h4eZJoSxBOi7R7GLjI3zWpeNUrCtjFmOmUw?=
 =?us-ascii?Q?WDR51ukDoaOCBmpG93eHFgzdmCTEcwBoCQW7I3wfCEDYHeK8oxg1DcdOLb7O?=
 =?us-ascii?Q?UDFOCrEyksL1txoi8KW6Vp2NwJs9PIpwiko6ImCb+NO4UglFkA8bTLp8YZ9E?=
 =?us-ascii?Q?TQz7iJYEfMfZwFeRg18VVmDSdcl5La7TDQDJVMlKerh+YUZynsCAa47X2Yv/?=
 =?us-ascii?Q?Mb2YsdG2WTZyOnjBPifvPYpuK4ccNSMNIGt7mQeHRv9TMVO+6mtnENVlMtGF?=
 =?us-ascii?Q?dyzuVu62xSOnUC0YVK+9PptnuIDrt9q0nckGa4T6yPeHCfUj3WHtENWQ6wc8?=
 =?us-ascii?Q?lLW2eIttWBetUWRFOWtp1UWUtk5AB1GNFaWcUoMtCzgMzxHGOGGjxeX0/g8i?=
 =?us-ascii?Q?BIxMo+KZGTXGF4ao+XV7XtTuUiu3lduwHfa6kTJhyybhZNrqcsTnvYLOtnmF?=
 =?us-ascii?Q?goG+CNjYUSNlxFyKHTyLptTSeA92UYbUABCKqRLB7iw4ov8xDQ1gUQt29X8C?=
 =?us-ascii?Q?zv1UPXEWKI3WCVq3kSCqzqRLHmQ3cEzNOFw1elmSGvWCRS3T4AKR3G2IuKqO?=
 =?us-ascii?Q?yF1rMBd4/lxCuskYXxBO0U4VUsdPCd2t8bUNgT2Dqy88mfk5TBUVJ6UoALC/?=
 =?us-ascii?Q?VrcYF1qjeUVpJskLwIbNJZGvwm5lvblDoLAtkfWF+u+Sl5uDgQ6whA4tKfdg?=
 =?us-ascii?Q?JQyBB/dQZPexxhH1T9+1lpQdeGnYPe1ct/4b38IJT17zYtIoMc3vW8g4FlEj?=
 =?us-ascii?Q?0D51B9HN2YcmgstOKtYo+f24tNYez+jakdevusLFTfD8eEYPI/owoj8Wp/Rl?=
 =?us-ascii?Q?TAmBeTk3mPsp1jayVrrN+QAcbUNYFrduRO7qyrOZI/foU+qbEi2iwETGVxyN?=
 =?us-ascii?Q?er5Cz/ZD89K+5KSLnnA1g1bOAAd9+HAcT4AJCCSlALyik82FjJ0dvXfvNt7D?=
 =?us-ascii?Q?xJaKKkUE7h2eo1++tZ4EfFefmR6u2/2XZvaKDdbFWky5LXQPmy23xD2SyCsk?=
 =?us-ascii?Q?DpguU8+w78kDaqucr3ihvgU0lVhCuZdqFr99MiAQuq4wzADZ+10ksDJw6ZFu?=
 =?us-ascii?Q?2jPeKMeXoCVWolm7i2khS4U=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2536bafa-92bd-40f2-179f-08db9d53b1b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 05:51:39.1848
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N4V+hTYAGkCdEuBFb0Aj1/yi1DaY781cCpXHeTn9+6tUuX1g47xHcrk/GVtXiyw8IUKnsV6cErga8vhU5KH+KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9058
Subject: [virtio-comment] RE: [EXT] [virtio] [PATCH requirements 2/7] net-features: Add low
 latency transmit queue requirements


> From: Satananda Burla <sburla@marvell.com>
> Sent: Friday, August 11, 2023 12:35 AM

> > +6. Ability to zero pad the transmit completion when the transmit
> > completion is
> > +   shorter than the CPU cache line size.
> Did you mean that the last completion in a cache line will be padded ?
> For ex if a transmit completion is 16 byte, you could fit 4 of them into =
a
> cacheline. But if device has got only 3 completions to post, it would pos=
t
> 3 and pad the last 16 bytes.=20
Right. Device can choose to pad last in above example.
If 2 completions are written, it can still choose to pad remaining 2.

> I hope you did not mean that every transmit
> completion is padded to cacheline size.
Right, I didn't mean that.
David had better wording to describe this. So I will use his suggestion.

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

