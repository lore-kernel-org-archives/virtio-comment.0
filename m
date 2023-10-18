Return-Path: <virtio-comment-return-7776-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B681CCDB47E
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 04:02:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E646385092
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 04:02:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BA3FC986896
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 04:02:22 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8CC1E986887; Wed, 18 Oct 2023 04:02:22 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 77D36986888
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 04:02:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bC6U3JmnNc+8p2GUIbkiQMTkVv4TPvL0gA8+ogRdkT2oT0msn1w9Fd43UjKCc2lopPXxPCbH4l1MqZmy/we2rPew+Ddp7oMcr4GS0hIA7IhxhtOk85zXSwF+Tqsk7Ol08y4YcKd6AIK0p5Wy47nyuA2MTRlRwO5H5KMDKZxECPGD+w/riOAOQx9fwrFbycFhIIZZ5lt0P03mxwId1/jsXucECnknfWVUN1gjvUwE7SPOj4Qc0o3ZP0Flo1mozAeESost9m+cNn+bTeiTKZkh85OQ4I8QLdoOSUZJy4SbR+qgHJ7P2KwDMRg3oKoMBUeCNaqNckj5cbuNHNKmXHgyjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WZxyVOJO/CQiX57CBVu2A1r0UZEACjaf5AxjEkQpqM=;
 b=EvhYDP4IXYYSccFep53Pk46aveH7xKZeHcLuJJ0+P7idFNBMQ/7/qWIwLtCHn28CrDqkP6k8fQRx8ZkkdxVKEgCd9jbIvxZrVivsyPasiEzRisAJ2/I8KZrc/H493uvkXcpj6M7LYJHU6z1YVA204PYZY2iwHbPXU24/XcHY9DIVoqES/zQl37f6yQc6//03Xht6oOswr5eVfLNQvDIRSgm8+VrYvyYzC5ThU37Ddez9Cq3a/DkRrOJXoFSitI9aghrc8zgfT2opGgqg4hOzWtliAiXhEPCgJ4PbfEWgDBXdBk+NK+XECbShIeb3Npvb/aC1wVGIWCgk48fsECX8OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: Jason Wang <jasowang@redhat.com>
CC: "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com"
	<sburla@marvell.com>, Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb
	<maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Thread-Topic: [virtio-comment] [PATCH v2 0/8] Introduce device migration
 support commands
Thread-Index: AQHaATWGrPsaHC6gFE6bswcyyPm03bBOuKqAgAA0H1A=
Date: Wed, 18 Oct 2023 04:02:19 +0000
Message-ID:
 <PH0PR12MB5481001C00D459EF30FB0BA3DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231017200645.779222-1-parav@nvidia.com>
 <CACGkMEtr7HWPQ+LRX1pR9EVq7Pe13OVjbQbdrGshZBsh_Rv_2A@mail.gmail.com>
In-Reply-To:
 <CACGkMEtr7HWPQ+LRX1pR9EVq7Pe13OVjbQbdrGshZBsh_Rv_2A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|SN7PR12MB8171:EE_
x-ms-office365-filtering-correlation-id: 883e6d31-938d-4643-9a52-08dbcf8f0656
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 FHv0Mnahj18xC6yQxJD7W/MGnKd+mDKgmuet4/alO4fzt7yu/BC5pgrH7MKQ6gf6BcB2WoMSd+3AIet/wBQlQASInwyJvgXXO5DqOKHaPBS8cTjT0vRVg+JSMRzTO9zXsL4Vcs8x9LFX96BtY1/jT1B8GAjlbo32oaqcK8IgJw8sQLzNpvky21iUq4CxUBGIcS5jwU4Ir86QRa75JqNz+kHskcmMqd6IEftA8xM3a0lj6QfNQpnnfepPoqhPwYnYnC8gkSCVSlywpkCu9Dm+wa+DStUY6FDRmz794kzQaP8Ew9kz3mwtjuscL1QAtueTYIBTPYUjj7sG3FryHjJI4ncPXAqVnX4pDwCOO2KCgpk5V0m6CJMptuO4lHYsdzU3xaPFCeVyj/iwmpFLGO6Blm6ok99FbHAPUCLDCgJa25ipWF52wCVN/pM5cVMkGdgRl++hcC9p6VkHwJceV/NywLmY+52es4Pe+2MXFYH3bC1ExKSY9BP2NGwSC84xYoRKOc1/reCxOKGYOuc9A1GZ6/HJ5N1TuyB47BkNW8eWiGNjIkbC+WgNlf3JyRXZmPKe4hmxT+SxMzD8ToC/htZSs7RhHeN/5vbc6QOH3rhc84WHPQwQnX4vyLIDnDDJqBLt
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(376002)(396003)(346002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(55016003)(478600001)(6506007)(41300700001)(7696005)(9686003)(71200400001)(316002)(5660300002)(26005)(122000001)(54906003)(64756008)(66476007)(66946007)(76116006)(66446008)(6916009)(66556008)(38070700005)(86362001)(38100700002)(33656002)(4326008)(4744005)(8676002)(52536014)(8936002)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WE96OGN5dXIyVjN3UUhEZ3Z1RnRuQzh1TWd3V2NmaDJVTTE1NXVJLzhSNmgw?=
 =?utf-8?B?TDdMeHJ6WktEOGtXMTRqUTdqRkhpMzhnREFtTzBReFVkR0YvU0RLTFdlUDZr?=
 =?utf-8?B?WDZaQmcwNGlZYVpsWDcyZW9HVWJmMndRSnRrSnJnMXJtSFUzb1Y3aFZ6Mnl5?=
 =?utf-8?B?MkJ3QUFQVlVMVEhZUXdUbFVNK0wzd2FXeVRZc0hpSXRqQXlhM2syaDZMRnZC?=
 =?utf-8?B?WHlqbll4M1lvdUQvdkJaSXd2WFNJdXhyMklOSkJqcE15SkVRdEdJZkI2bmJR?=
 =?utf-8?B?eVJwdFppUkZjTEEvK2xEVzdqVHpBSll1VnBuckloL2xHem5VMnZCaXd5Yzhs?=
 =?utf-8?B?UGxTMC9xMTZ6NWNIREM1aDRDKzdlTGg3WUMzOXNiWVRIVlQyNE1kQmluZTda?=
 =?utf-8?B?OWFEMUNEc290ODRKTmZsV0VhRnNwbFZsNklHUHI4RytpS3daN2s5YzgxamN4?=
 =?utf-8?B?TUN1WjlxL3RkMmtPRUNnMjY5SkViYm9HZFVnQkd5UXlDK1ZtNWkyL0JEVGgx?=
 =?utf-8?B?S0Y2bHdqeDJCaXArbmltS0RHNExoYnZqTUNBakVSNm5OdjB2cVV3aXZHeU8x?=
 =?utf-8?B?bXMzSzNWMDBINmtWMDNCeHRZQlhBcmxUU21qb3RvcDdjZG9uSlJJeklxT2ZX?=
 =?utf-8?B?aEdsZUJpSWFMMjlFbEVRc2dBRG5XZ2c4NTlWV1g5ZllIWThvbmxvV2xrRVVk?=
 =?utf-8?B?MTYycENQTWFPR1Ivd3l1S2hJVHpxclhyTnIyTkNqNTljb25mY2ZBUFRONjVI?=
 =?utf-8?B?RlFHQ2Rzc25uQU9RbmdMSlpYWkNUcTY4R1FET2NIc29lL0podzVFVEp1c2N2?=
 =?utf-8?B?bFlCbEM1dHl0bzJUamtPWlg5enBLYjZKNGNTZVNwMXI1cWU1YWNNbEVObUdM?=
 =?utf-8?B?U05SUXZlcjEwa2RQWjVBY1pPT3hCS1QzRlpub1ZtVGZRVkJFUFRZanN3UnYv?=
 =?utf-8?B?elF0TjhQL3AyYzNtSlJjZDJWZ2gvYWtabUVxNmsvQkdHZXhTaVNHNEsxWXZN?=
 =?utf-8?B?Q0l3NXZubCtVMVZpQ01FUDh6ZXJEajM2L3l0WnFvY2pHK25ydm9JYy9iL05k?=
 =?utf-8?B?YStHaG9BTFdZbDdnLzYyM3dIQVZLUmlQWVdHWmVRUkk3TmpYUzBoTHUyWnhC?=
 =?utf-8?B?c1ZBM3JnR0N3cHlYdkdITEQzZVY0VmZDaW04cHpURnc3L1A2dUV0Q0FPNmFj?=
 =?utf-8?B?TW1NODdpNDQzTG5GVGxSVUZ3NTVZOGFDZ3dqNlZFamg1cXErVE4xMnYyTldD?=
 =?utf-8?B?R3NqTWpWdlZ0Y05RK0NxMFFMY0E4ZnZJemRYYjU0Q2NBQzJxaFNzRVVpaW9i?=
 =?utf-8?B?aSthWGJBL0pIS1BuVGF0MHpuR3RkVkV4RVhhZjJhUkx4RDRaMHFHelBpZ3JD?=
 =?utf-8?B?cU5GRlpuWE9HRjBzRU55QTBwajB1WHgwRzZmRHhrMmR1eFZ6WW56WmRXaUMz?=
 =?utf-8?B?NGdUUVpoalJNUHk0eWc1UEtBcngvVEN5cURYNkYxNlR4Sk5lTnBRMVJoNHVG?=
 =?utf-8?B?NGFnc2pubTVwWkNveEdkRmlxcGk3ZzFoOHpkR0JCNk5mZ1RRVzNNU1lGem5o?=
 =?utf-8?B?NHhCTy9NVUtsdmYrdFI5UnpIekttTmNubVhOSXFjWUZlV3BXRkhtKzRoUTRG?=
 =?utf-8?B?OFFYa2RIS0FEOCtqNVRWM2g3WmxUMVlqYS83UUs5Q1BKZGFqVDE3OEN0ZU5B?=
 =?utf-8?B?MlRRcnZnSkhJQnBTM3ZSam9WK2VRV1IwTlRITU50MkcrYTQ2Q0JXaDdFeDN1?=
 =?utf-8?B?NGMxS05mU3diTUhRN3pSdW1IWWVjNWNrSUk1VWdmRC9jQzhZY3NlNlNsQjE5?=
 =?utf-8?B?Rm9ZOFlQV1U2Vm8zZUFSWkxMTWozai9HdkRDMENsZFplc1Y3VmpLTEpIU1Vm?=
 =?utf-8?B?TTFtNFlJc0Z2Qk9jWUU1bytSdnJIV2NNVkE4NnJUMUVYVFE5azQza1VBSW1E?=
 =?utf-8?B?VjJieVhML2FUKzhwRjRIL3Y3WjNVTTgrVm4rSWF1ZWJ0c0FxT2ZmanlMV0E1?=
 =?utf-8?B?RzJpZWdWTUh5aThMM1FTL1J1YnR0MjNQZFVFVm5Oc3gvU290YlQ5RW1KTERy?=
 =?utf-8?B?T1VPR1gvUTdpR2JicmNVQks5R1I2V0FOTUFCNlAyeld6ZEowb0ZBQUpZT0da?=
 =?utf-8?Q?KPL0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 883e6d31-938d-4643-9a52-08dbcf8f0656
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2023 04:02:19.6117
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vh3DEUjydu5OkEZQQYAW9QZ0/2ogB93ImqpiEiY+PuQEkcYd9+9wFOKh8m9YP8gteOsGV1Z+VYQe3FN7QmJ+eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8171
Subject: RE: [virtio-comment] [PATCH v2 0/8] Introduce device migration
 support commands

DQoNCj4gRnJvbTogdmlydGlvLWNvbW1lbnRAbGlzdHMub2FzaXMtb3Blbi5vcmcgPHZpcnRpby1j
b21tZW50QGxpc3RzLm9hc2lzLQ0KPiBvcGVuLm9yZz4gT24gQmVoYWxmIE9mIEphc29uIFdhbmcN
Cj4gU2VudDogV2VkbmVzZGF5LCBPY3RvYmVyIDE4LCAyMDIzIDY6MjQgQU0NCj4gDQo+IEEgbG90
IG9mIHF1ZXN0aW9ucyB3ZXJlIG5vdCBhbnN3ZXJlZCBpbiBWMSwgZG8geW91IGV4cGVjdCBtZSB0
byByZXBlYXQgaXQgYWdhaW4NCj4gaGVyZT8NCj4NCk5vLCBxdWVzdGlvbnMgcG9zdGVkIG9uIDEw
LzE3IGFuZCAxMC8xNiB3aWxsIGJlIGFuc3dlcmVkLg0KVGhlcmUgd2VyZSBhbHJlYWR5IG1hbnkg
c3VnZ2VzdGlvbnMgZnJvbSB5b3UgYW5kIE1pY2hhZWwgdG8gdGFrZSBjYXJlIG9mIGJlZm9yZSBs
b3NpbmcgdGhlbSBpbiAxMDAgbG9uZyBlbWFpbHMsIHNvIHBhdGNoZXMgbXVzdCBwcm9ncmVzcy4N
CkhlbmNlLCB2MiBjb3ZlcmVkIG1vc3QgY29tbWVudHMgYW5kIHN1Z2dlc3Rpb25zIHVwdG8gMTAv
MTUuDQo=

