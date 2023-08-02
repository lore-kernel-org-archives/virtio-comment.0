Return-Path: <virtio-comment-return-6977-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E416C04A94
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 18:32:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 75D5F42B51
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 18:32:38 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4C8BE9866D7
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 18:32:38 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 37BC0986654; Wed,  2 Aug 2023 18:32:38 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 23C5D986689;
	Wed,  2 Aug 2023 18:32:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fypZeUdrnlfeRX1xb88V2hxSw+OhE78QW7ZMqG11C65heC1IzB7s5Ra9L8wFz4fXCRPfvbRENsrpvEtXeVivAF+fJMNYvrHefWoe8QoVtFauZjU1UhAkEop1okaJrP71IkpRunp3jsnWZK2gIimYlifMvgDkckrGN0tRfyYnqPnLxg4osMKAd8DCT+Iw3nznIHe4Ic16+GrOGWZuYg1K+hcz4maVPrxRpH6qlylDpnDqhnLHhS+JP6/3EiCKdJ7vlNd3yJb7Uq2hWhQVLzpuzwf7OhYHuy9zE0q2/bBtj8/4e9xNg4sH6YpBoCcgC82dA0mzVGrMcrU7qghmvSB5Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B02qoAayPXr/C4VmboQNLO8oK3mM/r+R8GTqkuo60/c=;
 b=mZ03F4QknIKmzZN0XU/hry+eH5Q+Ri1wylMPfhw99EbNjTy3da6Lhjhk/fV7TibuD8arUfbxNwOrlZTFZBZznQCcCt/eubT8PIkvLEvZKzsyntEOaikV7GcTVL6pPopPthddYs4RwXTkn80RbEvtD2pYg0NcmCgaHPaX9o2nj6vDYAaK+oSqBinLYsR16JRcyNFiV+UqlDvKCqVYJ+w8n0dsROi2aAmjERxVK6vVI+c8iBXN1osPLX1N+Cx42lZPcqxml9tcczzsK9NCAtW/AVCz+A165jKJRDQteaoPqXmm+yUZMTfzxQjsVzy59R8KKOCG+Zvf53hvblZgdWaJ7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
From: Satananda Burla <sburla@marvell.com>
To: Parav Pandit <parav@nvidia.com>,
        "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>
CC: Shahaf Shuler <shahafs@nvidia.com>,
        "hengqi@linux.alibaba.com"
	<hengqi@linux.alibaba.com>,
        "virtio@lists.oasis-open.org"
	<virtio@lists.oasis-open.org>
Thread-Topic: [EXT] [virtio] [PATCH requirements 5/7] net-features: Add
 n-tuple receive flow filters requirements
Thread-Index: AQHZvd/x+MQx6UqlikiIZTDGukwDA6/WnZ9AgAAZeoCAAKZpQA==
Date: Wed, 2 Aug 2023 18:32:28 +0000
Message-ID: 
 <SJ0PR18MB4477D28C8CFED566195BEA7FC30BA@SJ0PR18MB4477.namprd18.prod.outlook.com>
References: <20230724033421.249893-1-parav@nvidia.com>
 <20230724033421.249893-6-parav@nvidia.com>
 <SJ0PR18MB44772855643A6348135CE8F1C30BA@SJ0PR18MB4477.namprd18.prod.outlook.com>
 <PH0PR12MB5481B38BB328AB72B9144651DC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: 
 <PH0PR12MB5481B38BB328AB72B9144651DC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR18MB4477:EE_|BN9PR18MB4186:EE_
x-ms-office365-filtering-correlation-id: 473245a3-4550-4b85-88e6-08db9386d370
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hjrmU3pXK+Nq4WUDBhpn5nrhJFczhLnyAyRuSPkqJwac+kKGffB2k/gWqxn2/BJtFGqCF4ElT0ZNw942K9E+uI2+EPBQ8TYNbazdr5boCIixdqfxzPb3H+XXlTMyB5t6Bnxhb7En7KXt1lPTB6MLwd1Hcih65uMZ5Umw1HpfvfVl1w13zN2KUb3pUtgFUGvzYhjRsKmMJWPrQtpHgLzweJTJluJMWN7zV9T0/zZD+Kcdh5Z0uQ4mh0DAKv4NrYVavLyARnMCjAdKo6S5Bw8tonWRe5UOnOFiblADSK0ichVDUwjTAMUZwJgj1MABqFDeXtseMwfucnm46al7Djj6f2ku/ZO7UpVsVWz8Fxp9DRiUAT39fgsCtLZVGFNaIVZU47rp+lVpNcLVUxmZieGhoM5cNbn6AmJGqUsMYEtkymWV7GiepaNEHI8hkJWo4ksDkeVnEkJ88SBSs7M1boirRwibwRgLsbChsK1ePHFShbCZbj1vHHVzI1vSccuSEljmhC0oTPuaQv7F2/TPp5a91rwxzly5mgCsEVTH4nt6VBmR1J1x8sAN6zqkSr0ScMzKA9bgDlJ4uIrqTfQO5C7CPpSk4RxIuMPWMp5jCeEcsiDH6qN0uXlIQviDBO3HqyLu
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB4477.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199021)(478600001)(33656002)(86362001)(9686003)(71200400001)(7696005)(8676002)(8936002)(41300700001)(316002)(5660300002)(66556008)(4326008)(66476007)(66446008)(64756008)(52536014)(83380400001)(55016003)(54906003)(110136005)(76116006)(38100700002)(66946007)(26005)(38070700005)(6506007)(186003)(122000001)(2906002)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?K2U1sJcO/CWFUBo4rwdBZovmuu0YrXwweVd1g46RecJcp4rXjrP9T+eXeJjy?=
 =?us-ascii?Q?AqqqIJtRAFjGBwyLZBCiDK2msbQPMRue3Bq/PiKLKdSC0uBZztFSdjxiG1aV?=
 =?us-ascii?Q?DxXlhZAjViQPGfVfvb+LW6PPn8rKVpdyrV2+yIoMdh60wIqxBB2T0PxSNvcx?=
 =?us-ascii?Q?FwN550PInxYkbYTqYxyIHjmnJSGR+kgI8N4EtMs+dSp91Bi0gdcHaFI9t6ON?=
 =?us-ascii?Q?6qouwVBUk2aKi+rvLYy+uVwRsS28DErb/49PZH8uQ25yQ45X/SeV6Wez7F1a?=
 =?us-ascii?Q?8+fBU3feAKquapZJr4R6c/kNVYWgzQ0N+/KyizI1Ot22Yjz3X5tpJXAT6xKM?=
 =?us-ascii?Q?0SpcLzXNtzOe7Urpi5hdCCh4CUbz3wMHdlaR+rSrHP52+E6hTEweI8g2QBOc?=
 =?us-ascii?Q?Xjk83HTiYZPK8RBriPM6lFno75lt/8RGeN4OdNJMzYNvpyqWS//QXt9th1ia?=
 =?us-ascii?Q?C2veBGnUl8WDTpKw9gCXgeGazw+LYL7Xdt/33RKrUFQEqcypAmHTrNsqM9SR?=
 =?us-ascii?Q?Si/blJ+NasFrjs1ecEoW7fqC7OhQB8zi8fE+F0Klcc8NyqNowDRVoh5buTgF?=
 =?us-ascii?Q?YTSzk3lLXW1q8S1tI7uNUnZg+Da25bm/aPpCVyAmubVMX9LgLdGAmn1TZI9c?=
 =?us-ascii?Q?TNtUNCDKZkZ6OGv1t3ofW6I/8ZMaXtxrtaV40Dk2sv577B5B6HMNnkgSEAjC?=
 =?us-ascii?Q?GZ5xau+/+fdzBl55bBZUg78AWYRbJtUvQaQmFBo0bBDIvtiM+eTdp2u3mm89?=
 =?us-ascii?Q?Ue5YIVnoKssUKhuNGh9FX32l6EDn1eXbZgp27nVq+E5I3xuBc1JtU+s/Iu5u?=
 =?us-ascii?Q?+sloin7GrMbgHHhy1nl75BJs0yip78YAPUcbA8NizD4lT76W9fiJ8VvPV8Uv?=
 =?us-ascii?Q?k3bWj/K4nMrwvs8rud3oBpinO45a/nwqxlw7fUP4xQ46dJs1zTw7q+LX6+UV?=
 =?us-ascii?Q?9mYOjz+b5GmmZE5DYlCoZEdTEQRYiwXKYqbjpReHdFDdOIEzdmShtapF5Em7?=
 =?us-ascii?Q?8YzXyEl2MEXKj9aoWKR9rZnpFtetB5go/H7JfgHscbf/9+Zy4oqTUohfmumW?=
 =?us-ascii?Q?5iUrWgOrCcJcP+ByxtbBX1T0Q1yUX2O0Up1ezDH13smIc5xRRYSJ3tfsLZv1?=
 =?us-ascii?Q?s//iR4daQKg8UBPiHnfSzRI3fZUtpMF4hrdY+TmYcs6MqmBgzx/EQMGWyBfK?=
 =?us-ascii?Q?Em4vjpcOkdhJr7iLbR3MLziKhTQrd85r1LHzhnvwj7plY8Vwc7yY1IKBOZWl?=
 =?us-ascii?Q?R9qtYDotDC/mo+I86qoaQ1IwbebypK0SP4on/F06UrSmkzzTzvKD2q1L4/an?=
 =?us-ascii?Q?4WdgsOqQnMKCLTEsTtSko1GQaRCYH5Jzsk4/Uha+Z1ms4B+ac50Iwcj1Wub1?=
 =?us-ascii?Q?WnE+ckK82qMGTKKsse8t7qcNy1zj5BMp3pIpiNzafjOV7ILcSmxSbyTSxZd9?=
 =?us-ascii?Q?u4cNEubN9dbzIAzHYo8JybG8AuDGwmhPw+qA2oEnqQP7cBB+Me2vUnPni8Fa?=
 =?us-ascii?Q?mxVvO9KbZ5Zq7PpZH2F58usBNU8Zln2DNVMettHloR0kDQxfiItoSmLeGtWv?=
 =?us-ascii?Q?7IK7wzuKdiH9DWmJZxY5q1yZKjeBCXhLA2H6xTFw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR18MB4477.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 473245a3-4550-4b85-88e6-08db9386d370
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 18:32:28.5040
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qviws7XcNhxh353OHQXupjIbfp9nItu+F8VVgu0Co4mKXXmwNaB9zcTA7s0ZzTX6lQUvGpdnWYHVcGVV/lwhuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR18MB4186
X-Proofpoint-GUID: O_j0nn48iU6xe5pOcv_FqYprPGRVrM5h
X-Proofpoint-ORIG-GUID: O_j0nn48iU6xe5pOcv_FqYprPGRVrM5h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_15,2023-08-01_01,2023-05-22_02
Subject: [virtio-comment] RE: [EXT] [virtio] [PATCH requirements 5/7] net-features: Add n-tuple
 receive flow filters requirements



> -----Original Message-----
> From: Parav Pandit <parav@nvidia.com>
> Sent: Wednesday, August 2, 2023 1:15 AM
> To: Satananda Burla <sburla@marvell.com>; virtio-comment@lists.oasis-
> open.org
> Cc: Shahaf Shuler <shahafs@nvidia.com>; hengqi@linux.alibaba.com;
> virtio@lists.oasis-open.org
> Subject: RE: [EXT] [virtio] [PATCH requirements 5/7] net-features: Add
> n-tuple receive flow filters requirements
>=20
>=20
> > From: Satananda Burla <sburla@marvell.com>
> > Sent: Wednesday, August 2, 2023 12:48 PM
>=20
> [..]
> > > +7. The device should process packet receive filters programmed via
> > > control vq
> > > +   commands first in the processing chain.
> > > +7. The device should process RFF entries before RSS configuration,
> > > i.e.,
> > > +   when there is a miss on the RFF entry, RSS configuration applies
> > > + if
> > > it exists.
> > > +8. To summarize the processing chain on a rx packet is:
> > > +   {mac,vlan,promisc rx filters} -> {receive flow filters} ->
> > > +{rss/hash
> > > config}.
> > Shouldn't this be
> >                                                          |-match->
> {RFF processing}
> > {mac,vlan,promisc rx filters} -> {receive flow filters} -|
> >                                                          |-no match->
> {rss/hash config}.
> I likely didn't understand your suggestion.
>=20
> In the filter chain, the first filters are promiscuous, mac, vlan
> filters which are programmed through the cvq.
> If mac filter of cvq drops the packet, packet does not reach the newly
> introduced RFF filter.
>=20
> This is because RFF are steering rules (like RSS).
> They do not override the existing mac/vlan filters from OS/driver pov.
>=20
> > The above looks like RSS processing will always happen.
>=20
> Oh my bad.
> Rss is only on the no_match, didn't clarify enough.
>=20
> Fixing it.
>=20
> > > +9. If multiple entries are programmed which has overlapping
> > > +attributes
> > > for a
> > > +   received packet, the driver to define the location/priority of
> the
> > > entry.
> > If driver does not provide group or provides same group with 2 rules
> that have a
> > same match part, does the new entry overwrite the old one for exact
> > matches(no mask) ? and for rules with masks, does the rule with
> longest match
> > take precedence? or the latest added rule takes precedence?
> > > +10. The filter entries are usually short in size of few tens of
> bytes,
> > > +   for example IPv6 + TCP tuple would be 36 bytes, and ops/sec rate
> is
> > > +   high, hence supplying fields inside the queue descriptor is
> > > preferred for
> > > +   up to a certain fixed size, say 56 bytes.
> > > +11. A flow filter entry consists of (a) match criteria, (b) action,
> > > +    (c) destination and (d) a unique 32 bit flow id, all supplied
> by
> > > the
> > > +    driver.
> > > +12. The driver should be able to query and delete flow filter entry
> > > +by
> > > the
> > > +    the device by the flow id.
> > The flowid here seems to be used for rule index. Can this be returned
> by the
> > device instead of being sent by driver? A 32 bit value to store might
> impose
> > undue restrictions on devices that have lesser capacity. Or could
> there be a
> > restriction that flowid cannot exceed the value returned by device as
> the
> > capacity.
> > > +
> I had thought about it as well.
> The main reason for driver to choose the value is, live migration
> scenario.
> If the device chooses _any_ id, then one vendor may choose A and other
> vendor may choose B and it may not work=20
>=20
> So one way is to keep driver supplied id we need to keep it detached
> from the capacity.
Ok. I was proposing that everybody agrees to use index value in 0-n per
group. I am fine with the size limitation described below.
>=20
> Alternatively,
> we can add max_value in the device provisioning flow to ease the device
> implementation.
> Like how we have max_vqs per device (num_queues in
> virtio_pci_common_cfg).
>=20
> (max capacity is already present in below flow_filter_capabilities
> struct).
Yes, this was my alternate suggestion as well. We could have a max value
in the provisioning flow.
>=20
> > > +### 3.4.3 interface example
> > > +
> > > +Flow filter capabilities to query using a DMA interface:
> > > +
> > > +```
> > > +struct flow_filter_capabilities {
> > > +	u8 flow_groups;
> > > +	u16 num_flow_filter_vqs;
> > > +	u16 start_vq_index;
> > > +	u32 max_flow_filters_per_group;
> > > +	u32 max_flow_filters;
> > > +	u64 supported_packet_field_mask_bmap[4];
> > > +};
> > > +
> > > +
> > > +```
> > > +
> > > +1. Flow filter entry add/modify, delete:
> > > +
> > > +struct virtio_net_rff_add_modify {
> > > +	u8 flow_op;
> > > +	u8 group_id;
> > > +	u8 padding[2];
> > > +	le32 flow_id;
> > > +	struct match_criteria mc;
> > > +	struct destination dest;
> > > +	struct action action;
> > > +
> > > +	struct match_criteria mask;	/* optional */
> > > +};
> > > +
> > > +2. Flow filter entry delete:
> > > +struct virtio_net_rff_delete {
> > > +	u8 flow_op;
> > > +	u8 group_id;
> > > +	u8 padding[2];
> > > +	le32 flow_id;
> > > +};
> > > --
> > > 2.26.2
> > >

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

